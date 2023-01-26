import Foundation

let 📜versionInfos = 📜VersionInfo.history(("1.1", "2021-03-01"),
                                           ("1.0.1", "2021-02-01"),
                                           ("1.0", "2021-01-01")) //降順。先頭の方が新しい

let 🔗appStoreProductURL = URL(string: "https://apps.apple.com/app/id?")!

let 👤privacyPolicy = """
2022-❓-❓

(English) This application don't collect user infomation.

(Japanese) このアプリ自身において、ユーザーの情報を一切収集しません。
"""

let 🔗webRepositoryURL = URL(string: "https://github.com/FlipByBlink/?")!
let 🔗webRepositoryURL_Mirror = URL(string: "https://gitlab.com/FlipByBlink/?_Mirror")!

enum 📁SourceFolder: String, CaseIterable, Identifiable {
    case main
    case 🧩Sub
    case 🧰Others
    var id: Self { self }
}
