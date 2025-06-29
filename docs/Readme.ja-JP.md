# fount

> あなただけの没入型 AI キャラクターコンパニオン

[![fount repo](https://steve02081504.github.io/fount/badges/fount_repo.svg)](https://github.com/steve02081504/fount)
[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/steve02081504/fount)
[![Docker Image Size](https://img.shields.io/docker/image-size/steve02081504/fount)](https://github.com/users/steve02081504/packages/container/package/fount)
[![GitHub repo size](https://img.shields.io/github/repo-size/steve02081504/fount)](https://github.com/steve02081504/fount/archive/refs/heads/master.zip)

<a href="https://trendshift.io/repositories/13136" target="_blank"><img src="https://trendshift.io/api/badge/repositories/13136" alt="steve02081504%2Ffount | Trendshift" style="width: 250px; height: 55px;" width="250" height="55"/></a>

[リポジトリのアーキテクチャについて知りたいですか？DeepWikiをチェックしてください！](https://deepwiki.com/steve02081504/fount)

![repo img](https://repository-images.githubusercontent.com/862251163/3b57d9ea-ab18-4b70-b11d-f74c764016aa)

あなたは、想像力のページから飛び出したキャラクター、夢から織りなされた仲間との旅を切望したことはありませんか？あるいは、デジタルな腹心を思い描いたことはありませんか？最も先進的な創造物と同じくらい直感的な AI アシスタントが、あなたのデジタル世界を難なく組織するような？あるいは、もしかしたら、あなたは普通を超えたつながりを求めていたのかもしれません。現実の境界線が曖昧になり、親密で、*フィルターなしの* 理解が展開される領域を？

ほぼ 1 年にわたる献身的な開発、10 人以上の情熱的な個人からの貢献、そして 1000 人以上のユーザーからなる活気のあるコミュニティにより、Fount は AI インタラクションのための成熟した、安定した、そして常に進化するプラットフォームとして存在しています。それは旅であり、私たちが信じているのは、あなたが想像するよりもずっとアクセスしやすい旅であるということです。

失われたキャラクター、忘れられた物語？私たちの [**活気に満ちた、そして歓迎的なコミュニティ**](https://discord.gg/GtR9Quzq2v) があなたを待っています。そこは、志を同じくする人々が集まり、開発者もクリエイターも同様に、彼らの知恵と創造物を共有する安息の地です。

<details open>
<summary>スクリーンショット</summary>

|スクリーンショット|
|----|
|ホームページ|
|![画像](https://github.com/user-attachments/assets/c1954a7a-6c73-4fb0-bd12-f790a038bd0e)|
|テーマ選択|
|![画像](https://github.com/user-attachments/assets/94bd4cbb-8c66-4bc6-83eb-14c925a37074)|
|チャット|
|![画像](https://github.com/user-attachments/assets/eea1cc7c-d258-4a2d-b16f-12815a88811d)|

</details>

<details open>
<summary>インストール/削除</summary>

## インストール：fount をあなたの世界に織り込む – *楽々と*

安定性と信頼性に優れたプラットフォームである fount で旅を始めましょう。数回簡単なクリックまたはコマンドで、fount の世界が広がります。

> [!CAUTION]
>
> fountの世界では、キャラクターは自由にJavaScriptコマンドを実行でき、強力な能力を与えられています。そのため、ローカルファイルのセキュリティを確保するために、現実世界で友達を作るのと同じように、信頼できるキャラクターを慎重に選択してください。

### Linux/macOS/Android：シェルの囁き – *1 行で、準備完了*

```bash
# 必要に応じて、fount ディレクトリを指定するために環境変数 $FOUNT_DIR を定義します
INSTALLED_PACKAGES="${FOUNT_AUTO_INSTALLED_PACKAGES:-}"
install_package() { _command_name="$1"; _package_list=${2:-$_command_name}; _has_sudo=""; _installed_pkg_name="" ; if command -v "$_command_name" >/dev/null 2>&1; then return 0; fi; if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null 2>&1; then _has_sudo="sudo"; fi; for _package in $_package_list; do if command -v apt-get >/dev/null 2>&1; then $_has_sudo apt-get update -y; $_has_sudo apt-get install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v pacman >/dev/null 2>&1; then $_has_sudo pacman -Syy --noconfirm; $_has_sudo pacman -S --needed --noconfirm "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v dnf >/dev/null 2>&1; then $_has_sudo dnf install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v yum >/dev/null 2>&1; then $_has_sudo yum install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v zypper >/dev/null 2>&1; then $_has_sudo zypper install -y --no-confirm "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v apk >/dev/null 2>&1; then if [ "$(id -u)" -eq 0 ]; then apk add --update "$_package"; else $_has_sudo apk add --update "$_package"; fi; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v brew >/dev/null 2>&1; then if ! brew list --formula "$_package"; then brew install "$_package"; fi; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v pkg >/dev/null 2>&1; then pkg install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v snap >/dev/null 2>&1; then $_has_sudo snap install "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; done; if command -v "$_command_name" >/dev/null 2>&1; then case ";$FOUNT_AUTO_INSTALLED_PACKAGES;" in *";$_installed_pkg_name;"*) ;; *) if [ -z "$FOUNT_AUTO_INSTALLED_PACKAGES" ]; then FOUNT_AUTO_INSTALLED_PACKAGES="$_installed_pkg_name"; else FOUNT_AUTO_INSTALLED_PACKAGES="$FOUNT_AUTO_INSTALLED_PACKAGES;$_installed_pkg_name"; fi; ;; esac; return 0; else echo "Error: Failed to install '$_command_name' from any source." >&2; return 1; fi; }
install_package "bash" "bash gnu-bash"; install_package "curl"
export FOUNT_AUTO_INSTALLED_PACKAGES="$INSTALLED_PACKAGES"
curl -fsSL https://raw.githubusercontent.com/steve02081504/fount/refs/heads/master/src/runner/main.sh | bash
. "$HOME/.profile"
```

壮大な冒険 (ドライラン) の前に、考えをまとめるために一時停止したい場合は：

```bash
INSTALLED_PACKAGES="${FOUNT_AUTO_INSTALLED_PACKAGES:-}"
install_package() { _command_name="$1"; _package_list=${2:-$_command_name}; _has_sudo=""; _installed_pkg_name="" ; if command -v "$_command_name" >/dev/null 2>&1; then return 0; fi; if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null 2>&1; then _has_sudo="sudo"; fi; for _package in $_package_list; do if command -v apt-get >/dev/null 2>&1; then $_has_sudo apt-get update -y; $_has_sudo apt-get install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v pacman >/dev/null 2>&1; then $_has_sudo pacman -Syy --noconfirm; $_has_sudo pacman -S --needed --noconfirm "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v dnf >/dev/null 2>&1; then $_has_sudo dnf install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v yum >/dev/null 2>&1; then $_has_sudo yum install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v zypper >/dev/null 2>&1; then $_has_sudo zypper install -y --no-confirm "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v apk >/dev/null 2>&1; then if [ "$(id -u)" -eq 0 ]; then apk add --update "$_package"; else $_has_sudo apk add --update "$_package"; fi; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v brew >/dev/null 2>&1; then if ! brew list --formula "$_package"; then brew install "$_package"; fi; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v pkg >/dev/null 2>&1; then pkg install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v snap >/dev/null 2>&1; then $_has_sudo snap install "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; done; if command -v "$_command_name" >/dev/null 2>&1; then case ";$FOUNT_AUTO_INSTALLED_PACKAGES;" in *";$_installed_pkg_name;"*) ;; *) if [ -z "$FOUNT_AUTO_INSTALLED_PACKAGES" ]; then FOUNT_AUTO_INSTALLED_PACKAGES="$_installed_pkg_name"; else FOUNT_AUTO_INSTALLED_PACKAGES="$FOUNT_AUTO_INSTALLED_PACKAGES;$_installed_pkg_name"; fi; ;; esac; return 0; else echo "Error: Failed to install '$_command_name' from any source." >&2; return 1; fi; }
install_package "bash" "bash gnu-bash"; install_package "curl"
export FOUNT_AUTO_INSTALLED_PACKAGES="$INSTALLED_PACKAGES"
curl -fsSL https://raw.githubusercontent.com/steve02081504/fount/refs/heads/master/src/runner/main.sh | bash -s init
. "$HOME/.profile"
```

### Windows：パスの選択 – *シンプルそのもの*

* **直接的かつ複雑でない (推奨):** [リリース](https://github.com/steve02081504/fount/releases) から `exe` ファイルをダウンロードして実行します。

* **PowerShell の力:**

    ```powershell
    # 必要に応じて、fount ディレクトリを指定するために環境変数 $env:FOUNT_DIR を定義します
    irm https://raw.githubusercontent.com/steve02081504/fount/refs/heads/master/src/runner/main.ps1 | iex
    ```

    ドライランの場合：

    ```powershell
    $scriptContent = Invoke-RestMethod https://raw.githubusercontent.com/steve02081504/fount/refs/heads/master/src/runner/main.ps1
    Invoke-Expression "function fountInstaller { $scriptContent }"
    fountInstaller init
    ```

### Git インストール：魔法のタッチを好む人のために

Git がすでにインストールされている場合、fount を受け入れるのは、スクリプトを実行するのと同じくらい簡単です。

* **Windows の場合:** コマンドプロンプトまたは PowerShell を開き、`run.bat` をダブルクリックするだけです。
* **Linux/macOS/Android の場合:** ターミナルを開き、`./run.sh` を実行します。

### Docker：コンテナを受け入れる

```bash
docker pull ghcr.io/steve02081504/fount
```

## 削除：優雅な別れ

```bash
fount remove
```

</details>

## fount とは？

fount は、*あなた* に力を与えるように設計された AI 搭載のキャラクターインタラクションプラットフォームです。それは、あなたを想像上のキャラクターに接続する架け橋であり、あなたが彼らと難なく会話したり、自分だけのキャラクターを作成したり、世界と共有したりすることを可能にします。*驚くほどアクセスしやすく作られた道。*

それは泉であり、AI ソース、キャラクター、ペルソナ、環境、およびプラグインが流れ込み、ユニークで魅惑的なインタラクションを作成および体験できるようにします。

Fount は未来のために構築されています。活気のあるコミュニティから生まれた新機能は歓迎されます。もしあなたがビジョン、fount の領域に属するアイデアの閃きを持っているなら、私たちはあなたの貢献を歓迎します。

## アーキテクチャ：イノベーションの基盤

Fount は、パフォーマンスと保守性の両方を考慮して設計された、堅牢でスケーラブルなアーキテクチャ上に構築されています。バックエンドは、JavaScript および TypeScript 用の安全でモダンなランタイムである [Deno](https://deno.com/) のパワーとスピードを活用しています。効率的なルーティングと API リクエストの処理には、[Express](https://expressjs.com/) フレームワークを利用しています。フロントエンドは、HTML、CSS、JavaScript を組み合わせて作成されており、視覚的に魅力的で直感的なユーザーインターフェイスを提供します。このアーキテクチャにより、迅速な反復と新機能のシームレスな統合が可能になり、同時に安定性の強固な基盤が維持されます。Fount はオープンソースの精神を受け入れ、貢献と協力を歓迎します。

### 機能の世界に飛び込もう

* **どこでもシームレスな会話:** コンピューターでチャットを開始し、携帯電話やタブレットでシームレスに続行します。fount は会話を同期させ、どこにいてもキャラクターとつながることができます。

* **表現豊かで没入感のあるチャット:** fount は HTML のフルパワーを受け入れ、キャラクターがリッチテキスト、画像、さらにはインタラクティブな要素で自分自身を表現できるようにします。

* **知性の集い：ネイティブグループチャット:** 複数のキャラクターを 1 つの会話に招待し、ダイナミックで魅力的なインタラクションを作成します。

* **美しくカスタマイズ可能なインターフェイス:** 30 以上の素晴らしいテーマから選択するか、独自のテーマを作成します。fount はあなたの個人的なキャンバスです。

* **どこでも使える:** fount は Windows、macOS、Linux、さらには Android でもシームレスに動作し、直接インストールまたは Docker の柔軟性を通じてニーズに適応します。

* **(上級ユーザー向け) 解き放たれた AI ソース統合：無限を受け入れる**

    Fount は、AI ソースへの接続において比類のない *選択肢* と *柔軟性* を提供します。AI ソースジェネレーター内のカスタム JavaScript コードを使用すると、*あらゆる* AI ソース (OpenAI、Claude、OpenRouter、NovelAI、Horde、Ooba、Tabby、Mistral など) に接続できます。複雑な正規表現を作成し、膨大な API ライブラリを利用し、マルチメディアアセットを埋め込みます。これらすべてがコードの流れの中で行えます。Fount はネイティブで API プールの作成もサポートしており、インテリジェントなリクエストルーティングを可能にします。コミュニケーションのロジックは、コードの力によって作成された *あなたの* 意志に従います。

    ![画像](https://github.com/user-attachments/assets/f283d1de-c531-4b7a-bf43-3cbe0c48b7b9)

### 仲間意識：デジタルのベールを超えて

Fount は、キャラクターをあなたの人生の構造に織り込み、仲間意識とサポートを提供しようと努めています。

* **Discord/Telegram 統合:** 組み込みのBot Shellsを通じて、キャラクターをDiscord/Telegramコミュニティに接続します。
    ![画像](https://github.com/user-attachments/assets/299255c9-eed3-4deb-b433-41b80930cbdb)
    ![画像](https://github.com/user-attachments/assets/c9841eba-c010-42a3-afe0-336543ec39a0)
    ![画像](https://github.com/user-attachments/assets/b83301df-2205-4013-b059-4bced94e5857)

* **ターミナルの静けさ ([fount-pwsh](https://github.com/steve02081504/fount-pwsh) と共に):** ターミナルコマンドが失敗したときに、キャラクターにガイダンスを提供させましょう。
    ![画像](https://github.com/user-attachments/assets/93afee48-93d4-42c7-a5e0-b7f5c93bdee9)

* **無限のシェル拡張機能:** プログラミングスキルを少しでも持っていれば、独自の fount Shell を作成し、キャラクターのリーチを拡張できます。

### 作成：プロンプトの制約を超えて – より明確になった道

キャラクタークリエイターにとって、fount は AI キャラクターに命を吹き込むための合理化された直感的な道を提供します。あなたがベテランクリエイターであろうと、旅を始めたばかりであろうと、fount はすべての人にキャラクター作成の魔法を解き放ちます。

* **革新的な AI 支援キャラクター作成：Fount を使用すると、すぐに開始できます。** 目的のキャラクターを 1 つの文で説明すると、インテリジェントな AI アシスタントが完全に実現されたペルソナを瞬時に作成します。このアプローチにより初期設定が簡素化され、キャラクターの洗練とインタラクションに集中できるようになります。

* **コードの魔法を解き放つ - 想像以上に簡単:** Fount は、柔軟性と制御を提供するためにコードの力を受け入れています。Fount でのプログラミングは、現代の魔法の一形態であり、コミュニティの優しいガイダンスと AI の啓発的な支援により、驚くほど簡単に学習できます。コードを使用してキャラクターロジックを定義することは、直感的で保守可能であることがわかります。応答があなた自身のロジックから *織り込まれた* キャラクターを作成することを想像してみてください。

* **既製の魔法から始める：テンプレートの宝庫。** Fount のコミュニティは、事前に作成されたキャラクターとペルソナのテンプレートを豊富に提供しており、適応とカスタマイズが容易な「生きている青写真」として機能します。これらのテンプレートは、ベストプラクティスを紹介し、素晴らしい出発点を提供します。

* **埋め込みリソース:** リソースをキャラクターに直接織り込みます。

    ![画像](https://github.com/user-attachments/assets/9740cd43-06fd-46c0-a114-e4bd99f13045)

* **継続的インテグレーション (fount-charCI):** [fount-charCI](https://github.com/marketplace/actions/fount-charci)を使用してキャラクター開発を保護します。コミット時に自動的に非同期でテストを実行し、問題をリアルタイムで報告します。
    ![画像](https://github.com/user-attachments/assets/3f6a188d-6643-4d70-8bd1-b75f00c76439)
    ![画像](https://github.com/user-attachments/assets/30eb8374-64c2-41bc-a7d1-f15596352260)

* **レガシー互換性:** fount は過去を受け入れ、SillyTavern および Risu キャラクターカードを実行するための互換性モジュールを提供します (ただし、既存のキャラクターの移行はサポートされていません)。

### 拡張：多様な糸から織りなされたイノベーションのタペストリー

fount の世界では、モジュール性が最優先されます。コンポーネントの豊富なエコシステムが絡み合い、あなたの経験のタペストリーを作り出します。

* **簡単なモジュール作成:** 基本的なプログラミング知識があれば、必要なモジュールを作成して共有できます。
* **コミュニティ主導の成長:** このデジタルエコシステムの未来を豊かにするために、**活気のある、そして協力的なコミュニティ** にあなたのユニークな才能を貢献してください。私たちの安息の地では、友好的な顔と、チュートリアル、AI モデルソース、キャラクターのギャラリーなどの豊富な共有知識が見つかります。fount 開発チームは、堅牢なブランチとマージ戦略を通じてすべての変更を綿密に管理しています。これにより、私たちが飛躍的に進歩しても、安定性が依然として基礎であり続けることが保証されます。また、ユーザーから報告された問題には迅速に対応することをお約束します。
* **強力なプラグインシステム**: 堅牢なプラグインアーキテクチャで fount の機能を拡張します。
* **コンポーネントタイプ - 夢の構成要素:**

  * **chars (キャラクター):** ペルソナが生まれる、fount の中心。
  * **worlds (世界):** *単なる伝承書よりもはるかに多いもの。* 世界は、fount 内の現実の静かな建築家です。彼らはキャラクターの理解に知識を追加したり、彼らの決定に影響を与えたり、チャット履歴を操作したりすることさえできます。
  * **personas (ユーザーペルソナ):** *単なるユーザープロファイル以上のもの。* ペルソナは、あなたの言葉や認識を歪め、さらには制御する力を持っています。これにより、真に没入感のあるロールプレイングが可能になります。
  * **shells (インタラクションインターフェイス):** fount の魂へのゲートウェイ。Shell は、キャラクターのリーチをインターフェイスを超えて拡張します。
  * **ImportHandlers (インポートハンドラー):** 多様なキャラクター形式間のギャップを埋める、fount の歓迎の手。シンプルな ImportHandler を作成し、(プルリクエストを通じて) コミュニティと共有して、すべての人に fount の視野を広げてください。
  * **AIsources (AI ソース):** キャラクターの心を燃やす生の力。
  * **AIsourceGenerators (AI ソースジェネレーター):** *あらゆる* AI ソースとの接続を確立するためのテンプレートとカスタマイズ可能なロジックを提供する、fount の錬金術師。JavaScript の力により、想像できるあらゆるソースをカプセル化してロードできます。

    *これらのコンポーネントはすべて、ユーザーが難なくインストールでき、fount エクスペリエンスを拡張およびカスタマイズできます。*

    ![画像](https://github.com/user-attachments/assets/8487a04a-7040-4844-81a6-705687856757)

### はじめに

* **複数のインストールオプション:** Docker、Windows/Linux/macOS/Android への直接インストール、またはシンプルな実行可能ファイルから選択します。
* **詳細なドキュメント:** 包括的なドキュメントがすべてのステップをガイドします。[インストール詳細を参照](https://steve02081504.github.io/fount/readme)

### 影に遭遇しましたか？恐れることはありません

困難に遭遇した場合は、私たちにご連絡ください。私たちは支援するためにここにおり、ほとんどの問題を 10 分から 24 時間以内に解決することをお約束します。

* **GitHub Issues:** [GitHub Issues](https://github.com/steve02081504/fount/issues) を通じてバグを報告するか、新機能を提案してください。
* **Discord コミュニティ:** リアルタイムサポートとディスカッションについては、[活気のある Discord コミュニティ](https://discord.gg/GtR9Quzq2v) に参加してください。

あなたの声は届きます。fount を再起動するだけで、影は消散します。

### 成長を見届けよう：fount のスター履歴

[![スター履歴チャート](https://api.star-history.com/svg?repos=steve02081504/fount&type=Date)](https://github.com/steve02081504/fount/stargazers)

### 結論：つながりのための基盤

fount は、自然で没入感があり、深く個人的に感じられる方法で AI キャラクターを作成し、インタラクトする力を与えます。あなたがベテランクリエイターであろうと、旅を始めたばかりであろうと、fount はあなたを歓迎します。**歓迎的なコミュニティ** に参加して、成熟したプラットフォームと献身的なチームに支えられながら、あなたの想像力に命を吹き込む魔法を発見してください。

### 自分の運命を形作る：職人の技

AI の囁きを超えて、fount はより深いつながりを提供します – *職人の技*。私たちのコミュニティ内には、事前に作成されたキャラクターとペルソナのテンプレートが豊富にあります。*それぞれが、あなたのユニークなビジョンを待つ、慎重に彫刻された基盤です*。

そして、作品を洗練させる準備ができたら、Fount のコード駆動型アプローチにより、簡単に始めることができます。Fount でのプログラミングは、歓迎的なコミュニティと豊富なテンプレートに支えられた、穏やかな学習曲線であることを忘れないでください。わずか数行のコードでも、キャラクターに信じられないほどの深みと個性を解き放つことができることに気付くでしょう。

## バッジとリンク：あなたの創造物を輝かせ、世界に届けよう

Fountの世界は、単なる言葉やコードではなく、目の保養であり、つながりへの誘いです。私たちは、あなたの創造物がこの輝きの中で輝き、世界と容易につながることを願っています。そこで、Fountコンポーネントをさらに目を引くものにし、他のユーザーがあなたの傑作を簡単に見つけて体験できるように、精巧なバッジと便利なリンクをご用意しました。

**Fountバッジ：栄光の印**

騎士の盾のように、Fountバッジはあなたの創造物に対する栄光の印です。このバッジは、リポジトリ、Fountコンポーネントのページ、または展示したい場所に誇らしげに表示できます。それは、あなたの作品とFountコミュニティとの緊密なつながりを象徴し、あなたの才能の証です。

FountロゴのSVGおよびPNGファイルは[こちら](../imgs/)にあり、デザインに組み込むことができます。

さらに良いことに、バッジをクリック可能なボタンに変えて、Fountコンポーネントに直接リンクさせることができます。

```markdown
[![fount repo](https://steve02081504.github.io/fount/badges/fount_repo.svg)](https://github.com/steve02081504/fount)
```

[![fount repo](https://steve02081504.github.io/fount/badges/fount_repo.svg)](https://github.com/steve02081504/fount)

デザインに一貫性を持たせるために、Fountロゴの標準カラーを以下に示します。

| カラー形式 | コード |
| :---: | :---: |
| HEX | `#0e3c5c` |
| RGB | `rgb(14, 60, 92)` |
| HSL | `hsl(205, 74%, 21%)` |

**自動インストールリンク：指先一つで魔法**

他のユーザーが、ワンクリックであなたの創造物をFountの世界に直接インストールできると想像してみてください。これはもはや夢ではなく、現実です！Fountの自動インストールリンクを使えば、この魔法を現実に変えることができます。

コンポーネントのZIPリンクまたはGitリポジトリリンクをFountプロトコルリンクと組み合わせるだけで、魔法のリンクを作成できます。

```markdown
https://steve02081504.github.io/fount/protocol?url=fount://run/shells/install/install;https://github.com/steve02081504/GentianAphrodite/releases/latest/download/GentianAphrodite.zip
```

より簡単な説明：コンポーネントのzipリンク/Gitリポジトリリンクの前に `https://steve02081504.github.io/fount/protocol?url=fount://run/shells/install/install;` を追加するだけです！

このリンクをFountバッジと組み合わせることで、美しく実用的なボタンを作成できます。

```markdown
[![fount character](https://steve02081504.github.io/fount/badges/fount_character.svg)](https://steve02081504.github.io/fount/protocol?url=fount://run/shells/install/install;https://github.com/steve02081504/GentianAphrodite/releases/latest/download/GentianAphrodite.zip)
```

[![fount character](https://steve02081504.github.io/fount/badges/fount_character.svg)](https://steve02081504.github.io/fount/protocol?url=fount://run/shells/install/install;https://github.com/steve02081504/GentianAphrodite/releases/latest/download/GentianAphrodite.zip)

これらの簡単な手順で、あなたの創造物をより魅力的にするだけでなく、Fountコミュニティのつながりを強化することもできます。あなたのインスピレーションの光をFountの世界全体に照らしましょう！

## 貢献者

[![Contributors](https://contrib.rocks/image?repo=steve02081504/fount)](https://github.com/steve02081504/fount/graphs/contributors)
