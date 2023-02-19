👆 Handiwork Memo
===================

### Localization
PROJECTS / Localizations

#### LocalizedStringKey
Localizable.strings

#### DisplayName
InfoPlist.strings / CFBundleDisplayName = "AAAA";

#### Glossaries
translations of strings from Apple OS
https://developer.apple.com/download/all/?q=Glossaries
https://applelocalization.com

### Source code bundle
TARGETS / Build Phases / Copy Files
Resources
SubPath

### Icon size
1024

### In-App Purchase
Capabilities / In-App Purchase
Edit Scheme / StoreKit Configuration
Configuration.storekit
ProductID: AAAA.adfree

### AppStoreConnect / Non-Exempt Encryption
info.plist / App Uses Non-Exempt Encryption - No

### Move "Preview Content"
Move: "AAAA/🧩Sub/Preview Content"
Edit: TARGETS / Build Settings / Development Assets

### Move "info.plist"
Move: "AAAA/🧩Sub/Info.plist"
Edit: TARGETS / Build Settings / Packaging / Info.plist File

### HealthKit
Capabilities / HealthKit
Info.plist / Privacy - Health Share Usage Description
Info.plist / Privacy - Health Update Usage Description
"Activate HeakthKit permission to record data."

#### Move "AAAA.entitlements"
Move: "AAAA/🧩Sub/AAAA.entitlements"
Edit: TARGETS / Build Settings / Signing / CODE_SIGN_ENTITLEMENTS
