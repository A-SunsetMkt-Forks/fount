#!/usr/bin/env bash

# 定义常量和路径
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
FOUNT_DIR=$(dirname "$SCRIPT_DIR")

# [合并] 若是 Windows 环境 (msys 或 cygwin)，则直接调用 PowerShell 脚本
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
	powerShell.exe -noprofile -executionpolicy bypass -file "$FOUNT_DIR\path\fount.ps1" "$@"
	exit $?
fi

# 转义后的 Fount 路径用于 sed 等命令
ESCAPED_FOUNT_DIR=$(echo "$FOUNT_DIR" | sed 's/\//\\\//g')

# 定义安装器数据目录和自动安装标记文件
INSTALLER_DATA_DIR="$FOUNT_DIR/data/installer"
INSTALLED_SYSTEM_PACKAGES_FILE="$INSTALLER_DATA_DIR/auto_installed_system_packages"
INSTALLED_PACMAN_PACKAGES_FILE="$INSTALLER_DATA_DIR/auto_installed_pacman_packages"
AUTO_INSTALLED_BUN_FLAG="$INSTALLER_DATA_DIR/auto_installed_bun"

# 初始化已安装的包列表 (数组形式)
INSTALLED_SYSTEM_PACKAGES_ARRAY=()
INSTALLED_PACMAN_PACKAGES_ARRAY=()

# 函数: 载入之前自动安装的包列表
load_installed_packages() {
	mkdir -p "$INSTALLER_DATA_DIR"
	if [[ -f "$INSTALLED_SYSTEM_PACKAGES_FILE" ]]; then
		IFS=';' read -r -a INSTALLED_SYSTEM_PACKAGES_ARRAY <<<"$(tr -d '\n' <"$INSTALLED_SYSTEM_PACKAGES_FILE")"
	fi
	if [[ -f "$INSTALLED_PACMAN_PACKAGES_FILE" ]]; then
		IFS=';' read -r -a INSTALLED_PACMAN_PACKAGES_ARRAY <<<"$(tr -d '\n' <"$INSTALLED_PACMAN_PACKAGES_FILE")"
	fi
	# 向后兼容，合并旧的环境变量
	if [[ -n "$FOUNT_AUTO_INSTALLED_PACKAGES" ]]; then
		IFS=';' read -r -a FOUNT_AUTO_INSTALLED_PACKAGES_ARRAY <<<"$FOUNT_AUTO_INSTALLED_PACKAGES"
		INSTALLED_SYSTEM_PACKAGES_ARRAY+=("${FOUNT_AUTO_INSTALLED_PACKAGES_ARRAY[@]}")
		INSTALLED_SYSTEM_PACKAGES_ARRAY=($(echo "${INSTALLED_SYSTEM_PACKAGES_ARRAY[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
		(
			IFS=';'
			echo "${INSTALLED_SYSTEM_PACKAGES_ARRAY[*]}"
		) >"$INSTALLED_SYSTEM_PACKAGES_FILE"
	fi
}

# 函数: 保存已安装的包列表到文件
save_installed_packages() {
	mkdir -p "$INSTALLER_DATA_DIR"
	(
		IFS=';'
		echo "${INSTALLED_SYSTEM_PACKAGES_ARRAY[*]}"
	) >"$INSTALLED_SYSTEM_PACKAGES_FILE"
	if [[ $IN_TERMUX -eq 1 ]]; then
		(
			IFS=';'
			echo "${INSTALLED_PACMAN_PACKAGES_ARRAY[*]}"
		) >"$INSTALLED_PACMAN_PACKAGES_FILE"
	fi
}

# 首次运行时载入包列表
load_installed_packages

# 检测环境
IN_DOCKER=0
if [ -f "/.dockerenv" ] || grep -q 'docker\|containerd' /proc/1/cgroup 2>/dev/null; then
	IN_DOCKER=1
fi
IN_TERMUX=0
if [[ -d "/data/data/com.termux" ]]; then
	IN_TERMUX=1
fi
OS_TYPE=$(uname -s)

# [合并] 引入 master 分支的通用辅助函数
# 辅助函数: 智能地使用包管理器进行安装 (包含更新逻辑)
install_with_manager() {
	local manager_cmd="$1"
	local package_to_install="$2"
	local update_args=""
	local install_args=""
	local has_sudo=""

	if ! command -v "$manager_cmd" &>/dev/null; then
		return 1
	fi

	# 非 root 用户且有 sudo 命令时，使用 sudo
	if [[ $(id -u) -ne 0 ]] && command -v sudo &>/dev/null; then
		has_sudo="sudo"
	fi

	case "$manager_cmd" in
	"apt-get")
		update_args="update -y"
		install_args="install -y"
		;;
	"pacman")
		update_args="-Syy --noconfirm"
		install_args="-S --needed --noconfirm"
		;;
	"dnf")
		update_args="makecache"
		install_args="install -y"
		;;
	"yum")
		update_args="makecache fast"
		install_args="install -y"
		;;
	"zypper")
		update_args="refresh"
		install_args="install -y --no-confirm"
		;;
	"pkg")
		update_args="update -y"
		install_args="install -y"
		;;
	"apk") install_args="add --update" ;;
	"brew")
		has_sudo=""
		install_args="install"
		;;
	"snap")
		if ! command -v sudo &>/dev/null; then return 1; fi
		has_sudo="sudo"
		install_args="install"
		;;
	*) return 1 ;;
	esac

	if [[ -n "$update_args" ]]; then
		# shellcheck disable=SC2086
		$has_sudo "$manager_cmd" $update_args
	fi

	# shellcheck disable=SC2086
	if $has_sudo "$manager_cmd" $install_args "$package_to_install"; then
		return 0
	fi

	return 1
}

# 函数: 将包添加到跟踪列表并保存
add_package_to_tracker() {
	local package="$1"
	local array_name="$2"
	local array_ref="${array_name}[@]"
	local found=0
	for p in "${!array_ref}"; do
		if [[ "$p" == "$package" ]]; then
			found=1
			break
		fi
	done

	if [[ $found -eq 0 ]]; then
		eval "${array_name}+=(\"$package\")"
		save_installed_packages
	fi
}

# 函数: 安装包 (尝试多种包管理器)
install_package() {
	local command_name="$1"
	# 如果第二个参数为空，则包名默认为命令名
	local package_list_str="${2:-$command_name}"
	local package_list=($package_list_str)

	if command -v "$command_name" &>/dev/null; then
		return 0
	fi

	for package in "${package_list[@]}"; do
		# 尝试所有已知的包管理器
		if
			install_with_manager "pkg" "$package" ||
				install_with_manager "apt-get" "$package" ||
				install_with_manager "pacman" "$package" ||
				install_with_manager "dnf" "$package" ||
				install_with_manager "yum" "$package" ||
				install_with_manager "zypper" "$package" ||
				install_with_manager "apk" "$package" ||
				install_with_manager "brew" "$package" ||
				install_with_manager "snap" "$package"
		then
			# 只要有一个安装成功，就检查命令是否可用
			if command -v "$command_name" &>/dev/null; then
				add_package_to_tracker "$package" "INSTALLED_SYSTEM_PACKAGES_ARRAY"
				return 0
			fi
		fi
	done

	echo "Error: Failed to install '$command_name' using any available package manager." >&2
	return 1
}

# 函数: 卸载包
uninstall_package() {
	local package_name="$1"
	local has_sudo=""
	if [[ $(id -u) -ne 0 ]] && command -v sudo &>/dev/null; then has_sudo="sudo"; fi

	# 尝试每个包管理器，成功后立即返回
	if command -v apt-get &>/dev/null && $has_sudo apt-get purge -y "$package_name" &>/dev/null; then return 0; fi
	if command -v pacman &>/dev/null && $has_sudo pacman -Rns --noconfirm "$package_name" &>/dev/null; then return 0; fi
	if command -v dnf &>/dev/null && $has_sudo dnf remove -y "$package_name" &>/dev/null; then return 0; fi
	if command -v yum &>/dev/null && $has_sudo yum remove -y "$package_name" &>/dev/null; then return 0; fi
	if command -v zypper &>/dev/null && $has_sudo zypper remove -y --no-confirm "$package_name" &>/dev/null; then return 0; fi
	if command -v apk &>/dev/null && $has_sudo apk del "$package_name" &>/dev/null; then return 0; fi
	if command -v brew &>/dev/null && brew uninstall "$package_name" &>/dev/null; then return 0; fi
	if command -v snap &>/dev/null && $has_sudo snap remove "$package_name" &>/dev/null; then return 0; fi
	if command -v pkg &>/dev/null && pkg uninstall -y "$package_name" &>/dev/null; then return 0; fi

	echo "Failed to uninstall $package_name. It might not be installed or managed by a recognized package manager." >&2
	return 1
}

# 函数: 运行 Bun，特殊处理 Termux 环境以使用 glibc-runner
run_bun() {
	local bun_args=("$@")
	local bun_cmd="bun"

	if [[ $IN_TERMUX -eq 1 ]]; then
		if command -v bun.glibc.sh &>/dev/null; then
			bun_cmd="bun.glibc.sh"
		elif command -v glibc-runner &>/dev/null && command -v bun &>/dev/null; then
			bun_cmd="glibc-runner $(which bun)"
		else
			echo "Warning: glibc-runner and bun.glibc.sh not found, falling back to plain bun in Termux (may not work)." >&2
		fi
	fi
	"$bun_cmd" "${bun_args[@]}"
}

# 函数: 为 Termux 环境下的 Bun 可执行文件打补丁，使其能通过 glibc-runner 运行
patch_bun() {
	local bun_bin=$(which bun)

	if [[ -z "$bun_bin" ]]; then
		echo "Error: Bun executable not found. Cannot patch." >&2
		return 1
	fi

	install_package "patchelf" "patchelf" || return 1

	# 使用 patchelf 修改 Bun 的 rpath 和 interpreter
	patchelf --set-rpath '${ORIGIN}/../glibc/lib' --set-interpreter "${PREFIX}/glibc/lib/ld-linux-aarch64.so.1" "$bun_bin"

	if [ $? -ne 0 ]; then
		echo "Error: Failed to patch Bun executable with patchelf." >&2
		return 1
	else
		# 创建一个包装脚本以正确设置环境
		mkdir -p ~/.bun/bin
		cat >~/.bun/bin/bun.glibc.sh <<'EOF'
#!/usr/bin/env sh
_oldpwd="${PWD}"
_dir="$(dirname "${0}")"
cd "${_dir}"
if ! [ -h "bun" ] ; then
	mv -f "bun" "bun.orig"
	ln -sf "bun.glibc.sh" "bun"
fi
cd "${_oldpwd}"
LD_PRELOAD= exec "${_dir}/bun.orig" "${@}"
EOF
		chmod u+x ~/.bun/bin/bun.glibc.sh
	fi
	return 0
}

# 函数: URL 编码
urlencode() {
	local string="$1"
	local strlen=${#string}
	local encoded=""
	local pos c o

	for ((pos = 0; pos < strlen; pos++)); do
		c="${string:$pos:1}"
		case "$c" in
		[-_.~a-zA-Z0-9]) o="${c}" ;;
		*) printf -v o '%%%02X' "'$c" ;;
		esac
		encoded+="${o}"
	done
	echo "${encoded}"
}

# 函数: 创建桌面快捷方式及协议处理器 (Linux & macOS)
create_desktop_shortcut() {
	echo "Creating desktop shortcut..."
	local shortcut_name="fount"
	local icon_path="$FOUNT_DIR/src/public/favicon.ico"

	if [ "$OS_TYPE" = "Linux" ]; then
		install_package "xdg-utils" "xdg-utils" || return 1

		# 创建应用启动器
		local desktop_file_path="$HOME/.local/share/applications/$shortcut_name.desktop"
		mkdir -p "$(dirname "$desktop_file_path")"
		cat >"$desktop_file_path" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=$shortcut_name
Comment=Fount Application
Exec=$FOUNT_DIR/path/fount open keepalive
Icon=$icon_path
Terminal=true
Categories=Utility;
EOF
		chmod +x "$desktop_file_path"
		echo "Desktop shortcut created at $desktop_file_path"

		# 注册 fount:// 协议处理器
		echo "Registering fount:// protocol handler..."
		local protocol_desktop_file_path="$HOME/.local/share/applications/fount-protocol.desktop"
		mkdir -p "$(dirname "$protocol_desktop_file_path")"
		cat >"$protocol_desktop_file_path" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=fount Protocol Handler
Comment=Handles fount:// protocol links
Exec=$FOUNT_DIR/path/fount protocolhandle %u
Terminal=false
NoDisplay=true
MimeType=x-scheme-handler/fount;
Categories=Utility;
EOF
		chmod +x "$protocol_desktop_file_path"
		xdg-mime default fount-protocol.desktop x-scheme-handler/fount
		if command -v update-desktop-database &>/dev/null; then
			update-desktop-database "$HOME/.local/share/applications"
		fi
		echo "fount:// protocol handler registered."

	elif [ "$OS_TYPE" = "Darwin" ]; then
		local app_path="$HOME/Desktop/$shortcut_name.app"
		rm -rf "$app_path"
		echo "Creating macOS application bundle at $app_path"

		mkdir -p "$app_path/Contents/MacOS" "$app_path/Contents/Resources"
		local icns_path="$FOUNT_DIR/src/public/favicon.icns"
		local icon_name="favicon.icns"
		if [ ! -f "$icns_path" ] && command -v sips &>/dev/null; then
			sips -s format icns "$icon_path" --out "$icns_path"
		fi
		if [ -f "$icns_path" ]; then
			cp "$icns_path" "$app_path/Contents/Resources/favicon.icns"
		else
			cp "$icon_path" "$app_path/Contents/Resources/favicon.ico"
			icon_name="favicon.ico"
		fi

		cat >"$app_path/Contents/Info.plist" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleExecutable</key><string>fount-launcher</string>
	<key>CFBundleIconFile</key><string>$icon_name</string>
	<key>CFBundleIdentifier</key><string>com.steve02081504.fount</string>
	<key>CFBundleName</key><string>$shortcut_name</string>
	<key>CFBundlePackageType</key><string>APPL</string>
	<key>CFBundleVersion</key><string>1</string>
	<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleURLName</key><string>Fount Protocol</string>
			<key>CFBundleURLSchemes</key><array><string>fount</string></array>
		</dict>
	</array>
</dict>
</plist>
EOF

		cat >"$app_path/Contents/MacOS/fount-launcher" <<EOF
#!/usr/bin/env bash
exec "$FOUNT_DIR/path/fount" open keepalive
EOF
		chmod -R u+rwx "$app_path"
		xattr -dr com.apple.quarantine "$app_path" 2>/dev/null

		local LSREGISTER_PATH="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"
		if [ -f "$LSREGISTER_PATH" ]; then
			"$LSREGISTER_PATH" -f "$app_path"
		fi
		killall -KILL Dock

		echo "Desktop application created at $app_path"
	else
		echo "Warning: Desktop shortcut creation not supported for your OS ($OS_TYPE)."
	fi
	return 0
}

# 函数: 移除桌面快捷方式和协议处理器
remove_desktop_shortcut() {
	echo "Removing desktop shortcut..."
	if [ "$OS_TYPE" = "Linux" ]; then
		rm -f "$HOME/.local/share/applications/fount.desktop" "$HOME/.local/share/applications/fount-protocol.desktop"
		if command -v update-desktop-database &>/dev/null; then
			update-desktop-database "$HOME/.local/share/applications"
		fi
		echo "Linux desktop entries removed."
	elif [ "$OS_TYPE" = "Darwin" ]; then
		rm -rf "$HOME/Desktop/fount.app"
		echo "macOS desktop application removed."
	fi
}

# 函数: 将 fount 路径添加到 PATH 环境变量
ensure_fount_path() {
	if [[ ":$PATH:" != *":$FOUNT_DIR/path:"* ]]; then
		local profile_files=("$HOME/.profile" "$HOME/.bashrc" "$HOME/.zshrc")
		for profile_file in "${profile_files[@]}"; do
			if [ -f "$profile_file" ] && ! grep -q "export PATH=.*$ESCAPED_FOUNT_DIR/path" "$profile_file"; then
				echo "Adding fount path to $profile_file..."
				if [ "$(tail -c 1 "$profile_file")" != $'\n' ]; then echo >>"$profile_file"; fi
				echo "export PATH=\"\$PATH:$FOUNT_DIR/path\"" >>"$profile_file"
			fi
		done
		export PATH="$PATH:$FOUNT_DIR/path"
	fi
}
ensure_fount_path

# 函数: 确保核心依赖可用
ensure_dependencies() {
	case "$1" in
	open | protocolhandle)
		install_package "nc" "netcat gnu-netcat openbsd-netcat netcat-openbsd nmap-ncat" || install_package "socat" "socat"
		install_package "jq" "jq"
		if [[ "$OS_TYPE" == "Linux" ]]; then install_package "xdg-open" "xdg-utils"; fi
		;;
	upgrade)
		install_package "git" "git"
		;;
	bun_install)
		install_package "curl" "curl"
		;;
	bun_install_fallback)
		install_package "unzip" "unzip"
		;;
	*) return 1 ;;
	esac
	return $?
}

# [合并] 采用 master 更优雅的后台任务处理方式
# 提取 'open' 和 'protocolhandle' 的后台任务脚本到一个变量中，避免代码重复
read -r -d '' BACKGROUND_IPC_JOB <<'EOF'
fount_ipc_internal() {
	local type="$1" data="$2" hostname="${3:-localhost}" port="${4:-16698}"
	local cmd_json="{\"type\":\"$type\",\"data\":$data}" response=""
	if command -v nc &>/dev/null; then
		response=$(echo "$cmd_json" | nc -w 3 "$hostname" "$port" 2>/dev/null)
	elif command -v socat &>/dev/null; then
		response=$(echo "$cmd_json" | socat -T 3 - TCP:"$hostname":"$port",nodelay 2>/dev/null)
	fi
	if [ -z "$response" ]; then return 1; fi
	local status=$(echo "$response" | jq -r '.status // empty')
	if [ "$status" = "ok" ]; then return 0; else return 1; fi
}
test_fount_running_internal() { fount_ipc_internal "ping" "{}"; }

local timeout=60 elapsed=0
while ! test_fount_running_internal; do
	sleep 1; elapsed=$((elapsed + 1))
	if [ "$elapsed" -ge "$timeout" ]; then
		echo "Error: Fount server did not start in time." >&2; exit 1
	fi
done
echo "Fount server is running. Opening URL..." >&2
local os_type_internal=$(uname -s)
if [ "$os_type_internal" = "Linux" ]; then
	xdg-open "$TARGET_URL" >/dev/null 2>&1
elif [ "$os_type_internal" = "Darwin" ]; then
	open "$TARGET_URL" >/dev/null 2>&1
fi
EOF

# 参数处理
if [[ $# -gt 0 ]]; then
	# 如果在 Docker 或 Termux 中执行 open/background/protocolhandle，则跳过这些特殊处理，直接执行后续命令
	if [[ "$1" == "open" || "$1" == "background" || "$1" == "protocolhandle" ]] && [[ $IN_DOCKER -eq 1 || $IN_TERMUX -eq 1 ]]; then
		shift
		"$0" "$@"
		exit $?
	fi
	case "$1" in
	open)
		ensure_dependencies "open" || exit 1
		export TARGET_URL='https://steve02081504.github.io/fount/protocol'
		nohup bash -c "$BACKGROUND_IPC_JOB" >/dev/null 2>&1 &
		"$0" "${@:2}" # 递归调用脚本处理剩余参数
		exit $?
		;;
	background)
		nohup "$0" "${@:2}" >/dev/null 2>&1 &
		exit 0
		;;
	protocolhandle)
		local protocolUrl="$2"
		if [ -z "$protocolUrl" ]; then
			echo "Error: No URL provided." >&2
			exit 1
		fi
		ensure_dependencies "protocolhandle" || exit 1
		export TARGET_URL="https://steve02081504.github.io/fount/protocol/?url=$(urlencode "$protocolUrl")"
		nohup bash -c "$BACKGROUND_IPC_JOB" >/dev/null 2>&1 &
		"$0" "${@:3}" # 递归调用脚本处理剩余参数
		exit $?
		;;
	esac
fi

# 函数: 升级 fount 仓库
fount_upgrade() {
	ensure_dependencies "upgrade" || return 0
	if [ ! -d "$FOUNT_DIR/.git" ]; then
		echo "Fount repository not found, cloning..."
		rm -rf "$FOUNT_DIR/.git-clone"
		mkdir -p "$FOUNT_DIR/.git-clone"
		git clone https://github.com/steve02081504/fount.git "$FOUNT_DIR/.git-clone" --no-checkout --depth 1 --single-branch
		if [ $? -ne 0 ]; then
			echo "Error: Failed to clone fount repository." >&2
			exit 1
		fi
		mv "$FOUNT_DIR/.git-clone/.git" "$FOUNT_DIR/.git"
		rm -rf "$FOUNT_DIR/.git-clone"
		git -C "$FOUNT_DIR" fetch origin && git -C "$FOUNT_DIR" clean -fd && git -C "$FOUNT_DIR" reset --hard "origin/master" && git -C "$FOUNT_DIR" checkout master
	else
		git -C "$FOUNT_DIR" fetch origin
		local currentBranch remoteBranch mergeBase localCommit remoteCommit
		currentBranch=$(git -C "$FOUNT_DIR" rev-parse --abbrev-ref HEAD)
		if [ "$currentBranch" = "HEAD" ]; then
			echo "Not on a branch, switching to 'master'..."
			git -C "$FOUNT_DIR" clean -fd && git -C "$FOUNT_DIR" reset --hard "origin/master" && git -C "$FOUNT_DIR" checkout master
			currentBranch=$(git -C "$FOUNT_DIR" rev-parse --abbrev-ref HEAD)
		fi
		remoteBranch=$(git -C "$FOUNT_DIR" rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null)
		if [ -z "$remoteBranch" ]; then
			git -C "$FOUNT_DIR" branch --set-upstream-to origin/master "$currentBranch"
			remoteBranch="origin/master"
		fi
		mergeBase=$(git -C "$FOUNT_DIR" merge-base "$currentBranch" "$remoteBranch")
		localCommit=$(git -C "$FOUNT_DIR" rev-parse "$currentBranch")
		remoteCommit=$(git -C "$FOUNT_DIR" rev-parse "$remoteBranch")
		if [ "$localCommit" != "$remoteCommit" ]; then
			if [ "$mergeBase" = "$localCommit" ]; then
				git -C "$FOUNT_DIR" reset --hard "$remoteBranch"
			else
				git -C "$FOUNT_DIR" reset --hard "$remoteBranch"
			fi
		fi
	fi
}

# 检查 .noupdate 文件，若存在则跳过更新
if [ -f "$FOUNT_DIR/.noupdate" ]; then
	echo "Skipping fount update due to .noupdate file."
else
	fount_upgrade
fi

# 函数: 安装 Bun
install_bun() {
	if command -v bun &>/dev/null && [[ $IN_TERMUX -eq 0 || -f ~/.bun/bin/bun.glibc.sh ]]; then return 0; fi
	if [[ -z "$(command -v bun)" && -f "$HOME/.bun/env" ]]; then . "$HOME/.bun/env"; fi
	if command -v bun &>/dev/null && [[ $IN_TERMUX -eq 0 || -f ~/.bun/bin/bun.glibc.sh ]]; then return 0; fi

	ensure_dependencies "bun_install" || exit 1
	if [[ $IN_TERMUX -eq 1 ]]; then
		echo "Installing Bun for Termux..."
		set -e # 启用严格模式，遇到错误立即退出
		yes y | pkg upgrade -y
		local termux_deps=("patchelf" "which" "time" "ldd" "tree" "pacman")
		for dep in "${termux_deps[@]}"; do install_package "$dep" "$dep"; done
		pacman-key --init && pacman-key --populate && pacman -Syu --noconfirm
		pacman -Sy glibc-runner --assume-installed bash,patchelf,resolv-conf --noconfirm
		add_package_to_tracker "glibc-runner" "INSTALLED_PACMAN_PACKAGES_ARRAY"
		set +e # 禁用严格模式
		curl -fsSL https://bun.sh/install | bash -s -- -y
		patch_bun
		touch "$AUTO_INSTALLED_BUN_FLAG"
	else
		echo "Bun not found, attempting to install..."
		if ! curl -fsSL https://bun.sh/install | bash -s -- -y; then
			echo "Bun official installation failed. Attempting manual download..." >&2
			ensure_dependencies "bun_install_fallback" || exit 1
			local bun_dl_url="https://github.com/oven-sh/bun/releases/latest/download/bun-"
			local arch_target current_arch=$(uname -m)
			case "$OS_TYPE" in
			Linux*) [[ "$current_arch" = "aarch64" ]] && arch_target="linux-aarch64.zip" || arch_target="linux-x64-baseline.zip" ;;
			Darwin*) [[ "$current_arch" = "arm64" ]] && arch_target="darwin-aarch64.zip" || arch_target="darwin-x64.zip" ;;
			*) arch_target="linux-x64-baseline.zip" ;;
			esac
			mkdir -p "$FOUNT_DIR/path"
			if curl -fL -o "/tmp/bun.zip" "${bun_dl_url}${arch_target}" && unzip -oj "/tmp/bun.zip" "*/bun" -d "$FOUNT_DIR/path"; then
				rm "/tmp/bun.zip" && chmod +x "$FOUNT_DIR/path/bun"
			else
				echo "Error: Failed to manually install Bun." >&2
				exit 1
			fi
		fi
		touch "$AUTO_INSTALLED_BUN_FLAG"
	fi
	# shellcheck source=/dev/null
	[ -f "$HOME/.bun/env" ] && . "$HOME/.bun/env"
	export PATH="$PATH:$HOME/.bun/bin"
	if ! command -v bun &>/dev/null; then
		echo "Error: Bun installation failed." >&2
		exit 1
	fi
}
install_bun

# 函数: 升级 Bun
bun_upgrade() {
	if [ $IN_DOCKER -eq 1 ]; then
		echo "Skipping Bun upgrade in Docker environment"
		return
	fi
	local bun_version_before=$(run_bun --revision 2>&1)
	if [[ -z "$bun_version_before" ]]; then
		echo "Could not determine Bun version. Skipping upgrade." >&2
		return
	fi
	local bun_upgrade_channel=""
	if [[ "$bun_version_before" == *"+"* ]]; then bun_upgrade_channel="--canary"; fi
	if ! run_bun upgrade $bun_upgrade_channel; then
		if [[ $IN_TERMUX -eq 1 ]]; then
			rm -rf "$HOME/.bun"
			install_bun
		else
			echo "Warning: Bun upgrade may have failed." >&2
		fi
	fi
}
bun_upgrade
echo "Bun $(run_bun --revision)"

# 函数: 运行 fount 主程序
run() {
	if [[ $(id -u) -eq 0 ]]; then echo "Warning: Not Recommended: Running fount as root." >&2; fi
	if [[ $IN_TERMUX -eq 1 ]]; then
		LANG_BACKUP="$LANG"
		export LANG="$(getprop persist.sys.locale)"
	fi
	if [[ $# -gt 0 && $1 = 'debug' ]]; then
		newargs=("${@:2}")
		run_bun run --inspect-brk --config="$FOUNT_DIR/bunfig.toml" --install=force --prefer-latest "$FOUNT_DIR/src/server/index.mjs" "${newargs[@]}"
	else
		run_bun run --config="$FOUNT_DIR/bunfig.toml" --install=force --prefer-latest "$FOUNT_DIR/src/server/index.mjs" "$@"
	fi
	local exit_code=$?
	if [[ $IN_TERMUX -eq 1 ]]; then export LANG="$LANG_BACKUP"; fi
	return $exit_code
}

# 首次运行或使用 'init' 参数时，安装 fount 依赖
if [[ ! -d "$FOUNT_DIR/node_modules" || ($# -gt 0 && $1 = 'init') ]]; then
	if [[ -d "$FOUNT_DIR/node_modules" ]]; then run "shutdown"; fi
	echo "Installing Fount dependencies..."
	set +e # 临时禁用严格模式，因为 Bun 首次安装可能出错
	run_bun install
	run "shutdown" 2>/dev/null || true
	set -e # 重新启用
	if [ $IN_DOCKER -eq 0 ] && [ $IN_TERMUX -eq 0 ]; then
		create_desktop_shortcut
	fi
	echo "======================================================"
	echo "WARNING: DO NOT install any untrusted fount parts on your system, they can do ANYTHING."
	echo "======================================================"
fi

# 主程序参数处理
case "$1" in
init)
	exit 0
	;;
keepalive)
	runargs=("${@:2}")
	run "${runargs[@]}"
	# [修复] 修正了 HEAD 分支中的错误嵌套循环
	while [ $? -ne 0 ]; do
		echo "Fount exited with an error, attempting to upgrade and restart..." >&2
		bun_upgrade
		fount_upgrade
		run "${runargs[@]}"
	done
	;;
remove)
	echo "Initiating fount uninstallation..."
	run shutdown
	local profile_files=("$HOME/.profile" "$HOME/.bashrc" "$HOME/.zshrc")
	for profile_file in "${profile_files[@]}"; do
		if [ -f "$profile_file" ]; then
			if [ "$OS_TYPE" = "Darwin" ]; then
				sed -i '' '/export PATH="\$PATH:'"$ESCAPED_FOUNT_DIR\/path"'"/d' "$profile_file"
			else
				sed -i '/export PATH="\$PATH:'"$ESCAPED_FOUNT_DIR\/path"'"/d' "$profile_file"
			fi
		fi
	done
	export PATH=$(echo "$PATH" | tr ':' '\n' | grep -v "$FOUNT_DIR/path" | grep -v "$HOME/.bun/bin" | tr '\n' ':' | sed 's/:*$//')
	remove_desktop_shortcut
	if [[ $IN_TERMUX -eq 1 ]]; then
		for package in "${INSTALLED_PACMAN_PACKAGES_ARRAY[@]}"; do pacman -R --noconfirm "$package"; done
	fi
	load_installed_packages
	for package in "${INSTALLED_SYSTEM_PACKAGES_ARRAY[@]}"; do uninstall_package "$package"; done
	if [ -f "$AUTO_INSTALLED_BUN_FLAG" ]; then
		echo "Uninstalling Bun..."
		rm -rf "$HOME/.bun"
		for profile_file in "${profile_files[@]}"; do
			if [ -f "$profile_file" ]; then
				if [ "$OS_TYPE" = "Darwin" ]; then sed -i '' '/\.bun/d' "$profile_file"; else sed -i '/\.bun/d' "$profile_file"; fi
			fi
		done
		rm -f "$AUTO_INSTALLED_BUN_FLAG"
	fi
	echo "Removing fount installation directory: $FOUNT_DIR"
	rm -rf "$FOUNT_DIR"
	echo "Fount uninstallation complete."
	exit 0
	;;
*)
	run "$@"
	;;
esac

exit $?
