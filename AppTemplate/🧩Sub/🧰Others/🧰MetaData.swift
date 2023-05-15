import SwiftUI

let ℹ️appName: LocalizedStringKey = "AppTemplate"
let ℹ️appSubTitle: LocalizedStringKey = "App for iPhone / iPad / Apple Watch"

let 📜versionInfos: [(version: String, date: String)] = [("1.1", "2021-03-01"),
                                                         ("1.0.1", "2021-02-01"),
                                                         ("1.0", "2021-01-01")] //降順。先頭の方が新しい

let 🔗appStoreProductURL = URL(string: "https://apps.apple.com/app/id?")!

let 👤privacyPolicyDescription = """
2022-❓-❓


English

This application don't collect user infomation.


日本語(Japanese)

このアプリ自身において、ユーザーの情報を一切収集しません。
"""

let 🔗webRepositoryURL = URL(string: "https://github.com/FlipByBlink/?")!
let 🔗webMirrorRepositoryURL = URL(string: "https://gitlab.com/FlipByBlink/?_Mirror")!

enum 📁SourceCodeCategory: String, CaseIterable, Identifiable {
    case main, Shared, Sub, Others, WatchApp, WatchComplication
    var id: Self { self }
    var fileNames: [String] {
        switch self {
            case .main:
                return ["AppTemplateApp.swift",
                        "📱AppModel.swift",
                        "ContentView.swift"]
            case .Shared:
                return []
            case .Sub:
                return ["📣ADContent.swift",
                        "💬RequestUserReview.swift",
                        "🛠AppMenu.swift",
                        "🄳ismissButton.swift"]
            case .Others:
                return ["🧰MetaData.swift",
                        "ℹ️AboutApp.swift",
                        "📣AD.swift",
                        "🛒InAppPurchase.swift"]
            case .WatchApp:
                return []
            case .WatchComplication:
                return []
        }
    }
}
