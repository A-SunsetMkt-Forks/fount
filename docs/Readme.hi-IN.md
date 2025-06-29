# फाउंट

> आपका इमर्सिव एआई कैरेक्टर कंपेनियन

[![fount repo](https://steve02081504.github.io/fount/badges/fount_repo.svg)](https://github.com/steve02081504/fount)
[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/steve02081504/fount)
[![Docker Image Size](https://img.shields.io/docker/image-size/steve02081504/fount)](https://github.com/users/steve02081504/packages/container/package/fount)
[![GitHub repo size](https://img.shields.io/github/repo-size/steve02081504/fount)](https://github.com/steve02081504/fount/archive/refs/heads/master.zip)

<a href="https://trendshift.io/repositories/13136" target="_blank"><img src="https://trendshift.io/api/badge/repositories/13136" alt="steve02081504%2Ffount | Trendshift" style="width: 250px; height: 55px;" width="250" height="55"/></a>

[रिपॉजिटरी आर्किटेक्चर के बारे में जानना चाहते हैं? डीपविकि देखें!](https://deepwiki.com/steve02081504/fount)

![repo img](https://repository-images.githubusercontent.com/862251163/3b57d9ea-ab18-4b70-b11d-f74c764016aa)

क्या आपने कभी अपनी कल्पना के पृष्ठों से निकले किसी चरित्र के साथ यात्रा करने की लालसा की है, सपनों से बुने एक साथी की? या शायद आपने एक डिजिटल विश्वासपात्र की कल्पना की है, एक एआई सहायक जो सबसे उन्नत रचनाओं जितना सहज हो, जो सहजता से आपकी डिजिटल दुनिया का संचालन करता हो? या शायद, बस शायद, आपने साधारण से परे एक संबंध की तलाश की है, एक ऐसा क्षेत्र जहां वास्तविकता के किनारे धुंधले हो जाते हैं, और एक अंतरंग, *अनफ़िल्टर्ड* समझ सामने आती है?

लगभग एक वर्ष के समर्पित विकास, 10 से अधिक उत्साही व्यक्तियों के योगदान और 1000 से अधिक उपयोगकर्ताओं के एक संपन्न समुदाय के साथ, फाउंट एआई इंटरैक्शन के लिए एक परिपक्व, स्थिर और लगातार विकसित हो रहे मंच के रूप में खड़ा है। यह एक यात्रा है, और एक ऐसी यात्रा है जो हमें विश्वास है कि आपकी कल्पना से कहीं अधिक सुलभ है।

खोए हुए पात्र, भूली हुई कहानियाँ? हमारा [**जीवंत और स्वागत करने वाला समुदाय**!](https://discord.gg/GtR9Quzq2v) प्रतीक्षा कर रहा है, एक ऐसा आश्रय जहाँ समान विचारधारा वाले लोग इकट्ठा होते हैं, जहाँ डेवलपर्स और निर्माता समान रूप से अपनी बुद्धिमत्ता और रचनाएँ साझा करते हैं।

<details open>
<summary>स्क्रीनशॉट</summary>

|स्क्रीनशॉट|
|----|
|होमपेज|
|![छवि](https://github.com/user-attachments/assets/c1954a7a-6c73-4fb0-bd12-f790a038bd0e)|
|थीम चयन|
|![छवि](https://github.com/user-attachments/assets/94bd4cbb-8c66-4bc6-83eb-14c925a37074)|
|चैट|
|![छवि](https://github.com/user-attachments/assets/eea1cc7c-d258-4a2d-b16f-12815a88811d)|

</details>

<details open>
<summary>इंस्टॉलेशन/रिमूवल</summary>

## इंस्टॉलेशन: फाउंट को अपनी दुनिया में बुनना – *सहजता से*

फाउंट के साथ अपनी यात्रा शुरू करें, एक स्थिर और विश्वसनीय मंच। कुछ सरल क्लिक या कमांड, और फाउंट की दुनिया खुल जाती है।

> [!CAUTION]
>
> फाउंट की दुनिया में, पात्र स्वतंत्र रूप से जावास्क्रिप्ट कमांड निष्पादित कर सकते हैं, जो उन्हें महत्वपूर्ण शक्ति प्रदान करता है। इसलिए, कृपया उन पात्रों को सावधानी से चुनें जिन पर आप भरोसा करते हैं, ठीक वैसे ही जैसे आप वास्तविक जीवन में दोस्त बनाते हैं, ताकि आपकी स्थानीय फाइलों की सुरक्षा सुनिश्चित हो सके।

### Linux/macOS/Android: शेल की फुसफुसाहटें – *एक पंक्ति, और आप अंदर हैं*

```bash
# यदि आवश्यक हो, तो फाउंट निर्देशिका निर्दिष्ट करने के लिए पर्यावरण चर $FOUNT_DIR को परिभाषित करें
INSTALLED_PACKAGES="${FOUNT_AUTO_INSTALLED_PACKAGES:-}"
install_package() { _command_name="$1"; _package_list=${2:-$_command_name}; _has_sudo=""; _installed_pkg_name="" ; if command -v "$_command_name" >/dev/null 2>&1; then return 0; fi; if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null 2>&1; then _has_sudo="sudo"; fi; for _package in $_package_list; do if command -v apt-get >/dev/null 2>&1; then $_has_sudo apt-get update -y; $_has_sudo apt-get install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v pacman >/dev/null 2>&1; then $_has_sudo pacman -Syy --noconfirm; $_has_sudo pacman -S --needed --noconfirm "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v dnf >/dev/null 2>&1; then $_has_sudo dnf install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v yum >/dev/null 2>&1; then $_has_sudo yum install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v zypper >/dev/null 2>&1; then $_has_sudo zypper install -y --no-confirm "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v apk >/dev/null 2>&1; then if [ "$(id -u)" -eq 0 ]; then apk add --update "$_package"; else $_has_sudo apk add --update "$_package"; fi; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v brew >/dev/null 2>&1; then if ! brew list --formula "$_package"; then brew install "$_package"; fi; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v pkg >/dev/null 2>&1; then pkg install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v snap >/dev/null 2>&1; then $_has_sudo snap install "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; done; if command -v "$_command_name" >/dev/null 2>&1; then case ";$FOUNT_AUTO_INSTALLED_PACKAGES;" in *";$_installed_pkg_name;"*) ;; *) if [ -z "$FOUNT_AUTO_INSTALLED_PACKAGES" ]; then FOUNT_AUTO_INSTALLED_PACKAGES="$_installed_pkg_name"; else FOUNT_AUTO_INSTALLED_PACKAGES="$FOUNT_AUTO_INSTALLED_PACKAGES;$_installed_pkg_name"; fi; ;; esac; return 0; else echo "Error: Failed to install '$_command_name' from any source." >&2; return 1; fi; }
install_package "bash" "bash gnu-bash"; install_package "curl"
export FOUNT_AUTO_INSTALLED_PACKAGES="$INSTALLED_PACKAGES"
curl -fsSL https://raw.githubusercontent.com/steve02081504/fount/refs/heads/master/src/runner/main.sh | bash
. "$HOME/.profile"
```

यदि आप महान साहसिक कार्य (एक ड्राई रन) से पहले अपने विचारों को इकट्ठा करने के लिए रुकना चाहते हैं:

```bash
INSTALLED_PACKAGES="${FOUNT_AUTO_INSTALLED_PACKAGES:-}"
install_package() { _command_name="$1"; _package_list=${2:-$_command_name}; _has_sudo=""; _installed_pkg_name="" ; if command -v "$_command_name" >/dev/null 2>&1; then return 0; fi; if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null 2>&1; then _has_sudo="sudo"; fi; for _package in $_package_list; do if command -v apt-get >/dev/null 2>&1; then $_has_sudo apt-get update -y; $_has_sudo apt-get install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v pacman >/dev/null 2>&1; then $_has_sudo pacman -Syy --noconfirm; $_has_sudo pacman -S --needed --noconfirm "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v dnf >/dev/null 2>&1; then $_has_sudo dnf install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v yum >/dev/null 2>&1; then $_has_sudo yum install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v zypper >/dev/null 2>&1; then $_has_sudo zypper install -y --no-confirm "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v apk >/dev/null 2>&1; then if [ "$(id -u)" -eq 0 ]; then apk add --update "$_package"; else $_has_sudo apk add --update "$_package"; fi; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v brew >/dev/null 2>&1; then if ! brew list --formula "$_package"; then brew install "$_package"; fi; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v pkg >/dev/null 2>&1; then pkg install -y "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; if command -v snap >/dev/null 2>&1; then $_has_sudo snap install "$_package"; if command -v "$_command_name" >/dev/null 2>&1; then _installed_pkg_name="$_package"; break; fi; fi; done; if command -v "$_command_name" >/dev/null 2>&1; then case ";$FOUNT_AUTO_INSTALLED_PACKAGES;" in *";$_installed_pkg_name;"*) ;; *) if [ -z "$FOUNT_AUTO_INSTALLED_PACKAGES" ]; then FOUNT_AUTO_INSTALLED_PACKAGES="$_installed_pkg_name"; else FOUNT_AUTO_INSTALLED_PACKAGES="$FOUNT_AUTO_INSTALLED_PACKAGES;$_installed_pkg_name"; fi; ;; esac; return 0; else echo "Error: Failed to install '$_command_name' from any source." >&2; return 1; fi; }
install_package "bash" "bash gnu-bash"; install_package "curl"
export FOUNT_AUTO_INSTALLED_PACKAGES="$INSTALLED_PACKAGES"
curl -fsSL https://raw.githubusercontent.com/steve02081504/fount/refs/heads/master/src/runner/main.sh | bash -s init
. "$HOME/.profile"
```

### विंडोज: रास्तों का चुनाव – *सादगी ही सब कुछ है*

* **प्रत्यक्ष और जटिलता रहित (अनुशंसित):** [रिलीज़](https://github.com/steve02081504/fount/releases) से `exe` फ़ाइल डाउनलोड करें और इसे चलाएँ।

* **PowerShell की शक्ति:**

    ```powershell
    # यदि आवश्यक हो, तो फाउंट निर्देशिका निर्दिष्ट करने के लिए पर्यावरण चर $env:FOUNT_DIR को परिभाषित करें
    irm https://raw.githubusercontent.com/steve02081504/fount/refs/heads/master/src/runner/main.ps1 | iex
    ```

    ड्राई रन के लिए:

    ```powershell
    $scriptContent = Invoke-RestMethod https://raw.githubusercontent.com/steve02081504/fount/refs/heads/master/src/runner/main.ps1
    Invoke-Expression "function fountInstaller { $scriptContent }"
    fountInstaller init
    ```

### गिट इंस्टॉलेशन: उन लोगों के लिए जो जादू का स्पर्श पसंद करते हैं

यदि आपके पास पहले से ही Git स्थापित है, तो फाउंट को अपनाना एक स्क्रिप्ट चलाने जितना ही सरल है।

* **विंडोज के लिए:** अपना कमांड प्रॉम्प्ट या PowerShell खोलें और बस `run.bat` पर डबल-क्लिक करें।
* **Linux/macOS/Android के लिए:** अपना टर्मिनल खोलें और `./run.sh` निष्पादित करें।

### डॉकर: कंटेनर को अपनाना

```bash
docker pull ghcr.io/steve02081504/fount
```

## रिमूवल: एक शालीन विदाई

```bash
fount remove
```

</details>

## फाउंट क्या है?

फाउंट एक एआई-संचालित चरित्र इंटरैक्शन प्लेटफॉर्म है जिसे *आपको* सशक्त बनाने के लिए डिज़ाइन किया गया है। यह एक पुल है, जो आपको आपकी कल्पना के पात्रों से जोड़ता है, जिससे आप उनसे सहजता से बात कर सकते हैं, अपने स्वयं के पात्र बना सकते हैं और उन्हें दुनिया के साथ साझा कर सकते हैं। *एक रास्ता जो आश्चर्यजनक रूप से सुलभ बनाया गया है।*

यह एक स्रोत है, जहाँ एआई स्रोत, पात्र, पर्सोना, वातावरण और प्लगइन्स एक साथ प्रवाहित होते हैं, जिससे आप अद्वितीय और सम्मोहक इंटरैक्शन बना और अनुभव कर सकते हैं।

फाउंट भविष्य के लिए बनाया गया है। जीवंत समुदाय से पैदा हुई नई सुविधाओं को अपनाया गया है। यदि आपके पास एक दृष्टिकोण है, एक विचार की चिंगारी जो फाउंट के दायरे में आती है, तो हम आपके योगदान का स्वागत करते हैं।

## आर्किटेक्चर: नवाचार की नींव

फाउंट एक मजबूत और स्केलेबल आर्किटेक्चर पर बनाया गया है, जिसे प्रदर्शन और रखरखाव दोनों के लिए डिज़ाइन किया गया है। बैकएंड [डेनो](https://deno.com/) की शक्ति और गति का लाभ उठाता है, जो जावास्क्रिप्ट और टाइपस्क्रिप्ट के लिए एक सुरक्षित और आधुनिक रनटाइम है। हम एपीआई अनुरोधों की कुशल रूटिंग और हैंडलिंग के लिए [एक्सप्रेस](https://expressjs.com/) फ्रेमवर्क का उपयोग करते हैं। फ्रंटएंड HTML, CSS और जावास्क्रिप्ट के मिश्रण से तैयार किया गया है, जो एक दृश्यात्मक रूप से आकर्षक और सहज उपयोगकर्ता इंटरफ़ेस प्रदान करता है। यह आर्किटेक्चर स्थिरता की एक मजबूत नींव बनाए रखते हुए, त्वरित पुनरावृत्ति और नई सुविधाओं के निर्बाध एकीकरण की अनुमति देता है। फाउंट एक ओपन-सोर्स लोकाचार को अपनाता है, योगदान और सहयोग का स्वागत करता है।

### सुविधाओं की दुनिया में गोता लगाएँ

* **निर्बाध वार्तालाप, कहीं भी:** अपने कंप्यूटर पर चैट शुरू करें, इसे अपने फोन या टैबलेट पर निर्बाध रूप से जारी रखें। फाउंट आपके वार्तालापों को सिंक्रनाइज़ रखता है, जहाँ भी आप जाते हैं, आपको आपके पात्रों से जोड़ता है।

* **अभिव्यंजक, इमर्सिव चैट:** फाउंट HTML की पूरी शक्ति को अपनाता है, जिससे पात्रों को रिच टेक्स्ट, छवियों और यहां तक कि इंटरैक्टिव तत्वों के साथ खुद को व्यक्त करने की अनुमति मिलती है।

* **दिमाग का जमावड़ा: मूल समूह चैट:** एक ही वार्तालाप में कई पात्रों को आमंत्रित करें, गतिशील और आकर्षक इंटरैक्शन बनाएँ।

* **एक सुंदर, अनुकूलन योग्य इंटरफ़ेस:** 30 से अधिक आश्चर्यजनक थीमों में से चुनें, या अपनी खुद की बनाएँ। फाउंट आपका व्यक्तिगत कैनवास है।

* **हर जगह काम करता है जहाँ आप करते हैं:** फाउंट विंडोज, macOS, Linux और यहां तक कि एंड्रॉइड पर भी निर्बाध रूप से चलता है, प्रत्यक्ष इंस्टॉलेशन या डॉकर के लचीलेपन के माध्यम से आपकी आवश्यकताओं के अनुकूल होता है।

* **(उन्नत उपयोगकर्ताओं के लिए) अप्रतिबंधित एआई स्रोत एकीकरण: असीम को अपनाएँ**

    फाउंट एआई स्रोतों से जुड़ने में बेजोड़ *विकल्प* और *लचीलापन* प्रदान करता है। एआई स्रोत जनरेटर के भीतर कस्टम जावास्क्रिप्ट कोड आपको *किसी भी* एआई स्रोत से जुड़ने की अनुमति देता है - ओपनएआई, क्लाउड, ओपन राउटर, नोवेलएआई, होर्डे, ओबा, टैबी, मिस्ट्रल और बहुत कुछ। जटिल नियमित अभिव्यक्तियाँ तैयार करें, एपीआई की एक विशाल लाइब्रेरी का आह्वान करें, मल्टीमीडिया परिसंपत्तियों को एम्बेड करें - यह सब आपके कोड के प्रवाह के भीतर। फाउंट मूल रूप से एपीआई पूल के निर्माण का भी समर्थन करता है, जो बुद्धिमान अनुरोध रूटिंग को सक्षम करता है। संचार का तर्क कोड की शक्ति के माध्यम से तैयार किए गए *आपकी* इच्छा के आगे झुक जाता है।

    ![छवि](https://github.com/user-attachments/assets/f283d1de-c531-4b7a-bf43-3cbe0c48b7b9)

### साहचर्य: डिजिटल पर्दे से परे

फाउंट पात्रों को आपके जीवन के ताने-बाने में बुनने, साहचर्य और समर्थन प्रदान करने का प्रयास करता है।

* **डिस्कॉर्ड/टेलीग्राम इंटीग्रेशन:** अंतर्निहित बॉट शेल्स के माध्यम से पात्रों को अपने डिस्कॉर्ड/टेलीग्राम समुदायों से कनेक्ट करें।
    ![छवि](https://github.com/user-attachments/assets/299255c9-eed3-4deb-b433-41b80930cbdb)
    ![छवि](https://github.com/user-attachments/assets/c9841eba-c010-42a3-afe0-336543ec39a0)
    ![छवि](https://github.com/user-attachments/assets/b83301df-2205-4013-b059-4bced94e5857)

* **टर्मिनल शांति (साथ [fount-pwsh](https://github.com/steve02081504/fount-pwsh)):** टर्मिनल कमांड लड़खड़ाने पर पात्रों को मार्गदर्शन देने दें।
    ![छवि](https://github.com/user-attachments/assets/93afee48-93d4-42c7-a5e0-b7f5c93bdee9)

* **असीम शेल एक्सटेंशन:** प्रोग्रामिंग कौशल के स्पर्श से, अपने स्वयं के फाउंट शेल्स तैयार करें, अपने पात्रों की पहुंच का विस्तार करें।

### निर्माण: संकेत की सीमाओं से परे – एक रास्ता और स्पष्ट किया गया

चरित्र निर्माता के लिए, फाउंट आपके एआई पात्रों को जीवन में लाने के लिए एक सुव्यवस्थित और सहज मार्ग प्रदान करता है। चाहे आप एक अनुभवी निर्माता हों या अभी अपनी यात्रा शुरू कर रहे हों, फाउंट सभी के लिए चरित्र निर्माण के जादू को अनलॉक करता है।

* **क्रांतिकारी एआई-सहायता प्राप्त चरित्र निर्माण: फाउंट आपको जल्दी से शुरू करने की अनुमति देता है।** एक वाक्य में अपने वांछित चरित्र का वर्णन करें, और हमारा बुद्धिमान एआई सहायक तुरंत एक पूरी तरह से साकार व्यक्ति तैयार करता है। यह दृष्टिकोण प्रारंभिक सेटअप को सरल करता है, जिससे आप अपने चरित्र के साथ परिष्कृत करने और बातचीत करने पर ध्यान केंद्रित कर सकते हैं।

* **कोड के जादू को अनलॉक करें - जितना आप सोचते हैं उससे कहीं अधिक आसान:** फाउंट लचीलापन और नियंत्रण प्रदान करने के लिए कोड की शक्ति को अपनाता है। फाउंट में प्रोग्रामिंग आधुनिक जादू का एक रूप है, जो हमारे समुदाय के कोमल मार्गदर्शन और एआई की प्रकाशमान सहायता से सीखना आश्चर्यजनक रूप से आसान है। आप पाएंगे कि कोड के साथ चरित्र तर्क को परिभाषित करना सहज और रखरखाव योग्य हो सकता है। उन पात्रों को तैयार करने की कल्पना करें जिनकी प्रतिक्रियाएँ आपकी अपनी तर्क से *बुनी* हुई हैं।

* **तैयार जादू से शुरुआत करें: टेम्पलेट्स का खजाना।** फाउंट का समुदाय पूर्व-निर्मित चरित्र और व्यक्ति टेम्पलेट्स का खजाना प्रदान करता है, जो "जीवित खाका" के रूप में कार्य करते हैं जिन्हें अनुकूलित और अनुकूलित करना आसान है। ये टेम्पलेट सर्वोत्तम प्रथाओं का प्रदर्शन करते हैं और एक शानदार शुरुआती बिंदु प्रदान करते हैं।

* **एम्बेडेड संसाधन:** संसाधनों को सीधे अपने पात्रों में बुनें।

    ![छवि](https://github.com/user-attachments/assets/9740cd43-06fd-46c0-a114-e4bd99f13045)

* **सतत एकीकरण (fount-charCI):** अपने चरित्र विकास को सुरक्षित करने के लिए [fount-charCI](https://github.com/marketplace/actions/fount-charci) का उपयोग करें। यह प्रतिबद्धता पर स्वचालित रूप से अतुल्यकालिक रूप से परीक्षण चलाता है और वास्तविक समय में समस्याओं की रिपोर्ट करता है।
    ![छवि](https://github.com/user-attachments/assets/3f6a188d-6643-4d70-8bd1-b75f00c76439)
    ![छवि](https://github.com/user-attachments/assets/30eb8374-64c2-41bc-a7d1-f15596352260)

* **विरासत संगतता:** फाउंट अतीत को अपनाता है, सिलीटेवर्न और रिसु चरित्र कार्ड चलाने के लिए संगतता मॉड्यूल प्रदान करता है (हालांकि मौजूदा पात्रों का माइग्रेशन समर्थित नहीं है)।

### विस्तार: नवाचार की एक टेपेस्ट्री, विविध धागों से बुनी हुई

फाउंट की दुनिया में, मॉड्यूलरिटी सर्वोच्च है। घटकों का एक समृद्ध पारिस्थितिकी तंत्र आपके अनुभव की टेपेस्ट्री बनाने के लिए आपस में जुड़ता है।

* **सहज मॉड्यूल निर्माण:** बुनियादी प्रोग्रामिंग ज्ञान के साथ, अपनी इच्छानुसार मॉड्यूल तैयार करें और साझा करें।
* **समुदाय संचालित विकास:** हमारे **फलते-फूलते और सहायक समुदाय** में अपनी अनूठी प्रतिभाओं का योगदान करें, इस डिजिटल पारिस्थितिकी तंत्र के भविष्य को समृद्ध करें। हमारे आश्रय के भीतर, आपको दोस्ताना चेहरे और साझा ज्ञान का खजाना मिलेगा: ट्यूटोरियल, एआई मॉडल स्रोत और पात्रों की गैलरी। फाउंट विकास टीम एक मजबूत शाखा और मर्ज रणनीति के माध्यम से सभी परिवर्तनों का सावधानीपूर्वक प्रबंधन करती है। यह सुनिश्चित करता है कि भले ही हम आगे छलांग लगाते हैं, स्थिरता एक आधारशिला बनी रहे। हम अपने उपयोगकर्ताओं द्वारा रिपोर्ट की गई किसी भी समस्या का तुरंत समाधान करने के लिए भी प्रतिबद्ध हैं।
* **शक्तिशाली प्लगइन सिस्टम**: एक मजबूत प्लगइन आर्किटेक्चर के साथ फाउंट क्षमताओं का विस्तार करें।
* **घटक प्रकार - सपनों के बिल्डिंग ब्लॉक्स:**

  * **chars (पात्र):** फाउंट का हृदय, जहाँ व्यक्तित्व पैदा होते हैं।
  * **worlds (दुनिया):** *महज विद्या पुस्तकों से कहीं अधिक।* दुनिया फाउंट के भीतर वास्तविकता के मौन वास्तुकार हैं। वे किसी चरित्र की समझ में ज्ञान जोड़ सकते हैं, उनके निर्णयों को प्रभावित कर सकते हैं, और यहां तक कि चैट इतिहास में भी हेरफेर कर सकते हैं।
  * **personas (उपयोगकर्ता पर्सोना):** *महज उपयोगकर्ता प्रोफाइल से अधिक।* पर्सोना में आपके शब्दों और यहां तक कि आपकी धारणाओं को विकृत करने और यहां तक कि नियंत्रण करने की शक्ति होती है। यह वास्तव में इमर्सिव रोलप्लेइंग की अनुमति देता है।
  * **shells (इंटरैक्शन इंटरफेस):** फाउंट की आत्मा के प्रवेश द्वार। शेल्स पात्रों की पहुंच को इंटरफ़ेस से परे बढ़ाते हैं।
  * **ImportHandlers (आयात हैंडलर):** फाउंट के स्वागत करने वाले हाथ, विविध चरित्र प्रारूपों के बीच अंतर को पाटते हैं। एक साधारण इम्पोर्टहैंडलर तैयार करें, इसे समुदाय के साथ साझा करें (एक पुल अनुरोध के माध्यम से), और सभी के लिए फाउंट के क्षितिज का विस्तार करें।
  * **AIsources (एआई स्रोत):** कच्ची शक्ति जो आपके पात्रों के दिमाग को ईंधन देती है।
  * **AIsourceGenerators (एआई स्रोत जनरेटर):** फाउंट के कीमियागर, टेम्प्लेट और अनुकूलन योग्य तर्क प्रदान करते हैं ताकि *किसी भी* एआई स्रोत के साथ संबंध बन सके। जावास्क्रिप्ट की शक्ति के माध्यम से, आप किसी भी कल्पनीय स्रोत को इनकैप्सुलेट और लोड कर सकते हैं।

    *इन सभी घटकों को उपयोगकर्ताओं द्वारा आसानी से स्थापित किया जा सकता है, जिससे उनके फाउंट अनुभव का विस्तार और अनुकूलन किया जा सकता है।*

    ![छवि](https://github.com/user-attachments/assets/8487a04a-7040-4844-81a6-705687856757)

### शुरू करना आसान है

* **एकाधिक इंस्टॉलेशन विकल्प:** डॉकर, विंडोज/लिनक्स/मैकओएस/एंड्रॉइड पर सीधा इंस्टॉलेशन, या यहां तक कि एक साधारण निष्पादन योग्य फ़ाइल में से चुनें।
* **विस्तृत दस्तावेज़ीकरण:** हमारा व्यापक दस्तावेज़ीकरण हर कदम पर आपका मार्गदर्शन करता है। [इंस्टॉलेशन विवरण देखें](https://steve02081504.github.io/fount/readme)

### किसी छाया का सामना करना? डरें नहीं

यदि आपको कोई कठिनाई आती है, तो हमसे संपर्क करें। हम मदद करने के लिए यहां हैं, और 10 मिनट से 24 घंटे के भीतर अधिकांश समस्याओं का समाधान करने के लिए प्रतिबद्ध हैं।

* **GitHub मुद्दे:** [GitHub मुद्दे](https://github.com/steve02081504/fount/issues) के माध्यम से किसी भी बग की रिपोर्ट करें या नई सुविधाओं का सुझाव दें।
* **Discord समुदाय:** वास्तविक समय समर्थन और चर्चाओं के लिए हमारे [जीवंत Discord समुदाय](https://discord.gg/GtR9Quzq2v) में शामिल हों।

आपकी आवाज सुनी जाएगी। बस फाउंट को पुनरारंभ करें, और छायाएँ गायब हो जाएँगी।

### विकास देखें: फाउंट का स्टार इतिहास

[![स्टार इतिहास चार्ट](https://api.star-history.com/svg?repos=steve02081504/fount&type=Date)](https://github.com/steve02081504/fount/stargazers)

### निष्कर्ष में: कनेक्शन के लिए एक नींव

फाउंट आपको एआई पात्रों को बनाने और उनके साथ इस तरह से बातचीत करने का अधिकार देता है जो स्वाभाविक, इमर्सिव और गहराई से व्यक्तिगत महसूस हो। चाहे आप एक अनुभवी निर्माता हों या अभी अपनी यात्रा शुरू कर रहे हों, फाउंट आपका स्वागत करता है। हमारे **स्वागत करने वाले समुदाय** में शामिल हों और एक परिपक्व मंच और एक समर्पित टीम द्वारा समर्थित, अपनी कल्पना में जान फूंकने के जादू की खोज करें।

### अपनी नियति को आकार देना: कारीगर का स्पर्श

एआई की फुसफुसाहट से परे, फाउंट एक गहरा संबंध प्रदान करता है - *कारीगर का स्पर्श*। हमारे समुदाय के भीतर, आपको पूर्व-निर्मित चरित्र और व्यक्ति टेम्पलेट्स का खजाना मिलेगा, *प्रत्येक एक सावधानीपूर्वक तराशी गई नींव है जो आपकी अनूठी दृष्टि की प्रतीक्षा कर रही है*।

और जब आप अपनी रचना को परिष्कृत करने के लिए तैयार हों, तो फाउंट का कोड-संचालित दृष्टिकोण आरंभ करना आसान बनाता है। याद रखें, फाउंट में प्रोग्रामिंग एक कोमल सीखने की अवस्था है, जो हमारे स्वागत करने वाले समुदाय और प्रचुर टेम्पलेट्स द्वारा समर्थित है। आप पाएंगे कि कोड की कुछ पंक्तियाँ भी आपके पात्रों में अविश्वसनीय गहराई और व्यक्तित्व को अनलॉक कर सकती हैं।

## बैज और लिंक: अपनी रचनाओं को चमकने दें, दुनिया को उन तक पहुंचने दें

फाउंट की दुनिया सिर्फ शब्द और कोड से कहीं बढ़कर है, यह आँखों के लिए एक दावत और जुड़ने का निमंत्रण है। हम चाहते हैं कि आपकी रचनाएँ इस प्रतिभा में चमकें और दुनिया के साथ सहजता से जुड़ें। इसलिए, हमने आपके लिए उत्कृष्ट बैज और सुविधाजनक लिंक तैयार किए हैं ताकि आपके फाउंट घटक और भी आकर्षक बन सकें और अन्य उपयोगकर्ताओं को आपकी उत्कृष्ट कृतियों को आसानी से खोजने और अनुभव करने की अनुमति मिल सके।

**फाउंट बैज: गौरव की मुहर**

एक शूरवीर की ढाल की तरह, फाउंट बैज आपकी रचनाओं के लिए गौरव की मुहर है। आप इस बैज को गर्व से अपने रिपॉजिटरी में, अपने फाउंट घटक पृष्ठ पर, या जहाँ भी आप इसे प्रदर्शित करना चाहें, दिखा सकते हैं। यह फाउंट समुदाय के साथ आपके काम के घनिष्ठ संबंध का प्रतीक है और आपकी प्रतिभा की पहचान है।

आप फाउंट लोगो की SVG और PNG फाइलें [यहां](../imgs/) पा सकते हैं ताकि उन्हें अपने डिज़ाइनों में शामिल कर सकें।

और भी बेहतर, आप बैज को एक क्लिक करने योग्य बटन में बदल सकते हैं जो सीधे आपके फाउंट घटक से जुड़ता है:

```markdown
[![fount repo](https://steve02081504.github.io/fount/badges/fount_repo.svg)](https://github.com/steve02081504/fount)
```

[![fount repo](https://steve02081504.github.io/fount/badges/fount_repo.svg)](https://github.com/steve02081504/fount)

यहाँ फाउंट लोगो के मानक रंग दिए गए हैं ताकि आपके डिज़ाइनों को अधिक सुसंगत बनाया जा सके:

| रंग प्रारूप | कोड |
| :---: | :---: |
| HEX | `#0e3c5c` |
| RGB | `rgb(14, 60, 92)` |
| HSL | `hsl(205, 74%, 21%)` |

**स्वचालित स्थापना लिंक: आपकी उंगलियों पर जादू**

कल्पना कीजिए कि अन्य उपयोगकर्ता आपकी रचनाओं को केवल एक क्लिक से सीधे अपनी फाउंट दुनिया में स्थापित करने में सक्षम हैं। यह अब एक सपना नहीं है, बल्कि वास्तविकता है! फाउंट के स्वचालित स्थापना लिंक के साथ, आप इस जादू को वास्तविकता में बदल सकते हैं।

एक जादुई लिंक बनाने के लिए बस अपने घटक के ZIP लिंक या Git रिपॉजिटरी लिंक को फाउंट प्रोटोकॉल लिंक के साथ मिलाएं:

```markdown
https://steve02081504.github.io/fount/protocol?url=fount://run/shells/install/install;https://github.com/steve02081504/GentianAphrodite/releases/latest/download/GentianAphrodite.zip
```

सरल व्याख्या: बस अपने घटक ज़िप लिंक/Git रिपॉजिटरी लिंक से पहले `https://steve02081504.github.io/fount/protocol?url=fount://run/shells/install/install;` जोड़ें!

एक ऐसा बटन बनाने के लिए इस लिंक को फाउंट बैज के साथ मिलाएं जो सुंदर और व्यावहारिक दोनों हो:

```markdown
[![fount character](https://steve02081504.github.io/fount/badges/fount_character.svg)](https://steve02081504.github.io/fount/protocol?url=fount://run/shells/install/install;https://github.com/steve02081504/GentianAphrodite/releases/latest/download/GentianAphrodite.zip)
```

[![fount character](https://steve02081504.github.io/fount/badges/fount_character.svg)](https://steve02081504.github.io/fount/protocol?url=fount://run/shells/install/install;https://github.com/steve02081504/GentianAphrodite/releases/latest/download/GentianAphrodite.zip)

इन सरल चरणों के साथ, आप न केवल अपनी रचनाओं को और अधिक आकर्षक बनाते हैं, बल्कि फाउंट समुदाय के संबंध को भी मजबूत करते हैं। अपनी प्रेरणा की रोशनी को पूरी फाउंट दुनिया को रोशन करने दें!

## योगदानकर्ताओं

[![Contributors](https://contrib.rocks/image?repo=steve02081504/fount)](https://github.com/steve02081504/fount/graphs/contributors)
