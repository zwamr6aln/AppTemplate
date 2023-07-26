import SwiftUI

enum 🗒️StaticInfo {
    static let appName: LocalizedStringKey = "AppTemplate"
    static let appSubTitle: LocalizedStringKey = "App for iPhone / iPad / Mac / Apple Watch"
    
    static let appStoreProductURL = URL(string: "https://apps.apple.com/app/id?")!
    static var appStoreUserReviewURL: URL { URL(string: "\(Self.appStoreProductURL)?action=write-review")! }
    
    static let privacyPolicyDescription = """
        2022-❓-❓
        
        
        English
        
        This application don't collect user infomation.
        
        
        日本語(Japanese)
        
        このアプリ自身において、ユーザーの情報を一切収集しません。
        """
    
    static let webRepositoryURL = URL(string: "https://github.com/FlipByBlink/?")!
    static let webMirrorRepositoryURL = URL(string: "https://gitlab.com/FlipByBlink/?_Mirror")!
}

#if os(iOS)
extension 🗒️StaticInfo {
    static let versionInfos: [(version: String, date: String)] = [("1.1", "2021-03-01"),
                                                                  ("1.0.1", "2021-02-01"),
                                                                  ("1.0", "2021-01-01")] //降順。先頭の方が新しい
    
    enum SourceCodeCategory: String, CaseIterable, Identifiable {
        case main, Sub, Rest
        var id: Self { self }
        var fileNames: [String] {
            switch self {
                case .main: ["App.swift",
                             "ContentView.swift",
                             "📱AppModel.swift"]
                case .Sub: ["📱AppModel(Extension).swift",
                            "🪧Sheet.swift",
                            "📣ADContent.swift",
                            "💬RequestUserReview.swift",
                            "🩹Workaround.swift"]
                case .Rest: ["🗒️StaticInfo.swift",
                             "ℹ️AboutApp.swift",
                             "📣ADModel.swift",
                             "📣ADComponents.swift",
                             "🛒InAppPurchaseModel.swift",
                             "🛒InAppPurchaseView.swift"]
            }
        }
    }
}

#elseif os(watchOS)
extension 🗒️StaticInfo {
    enum SourceCodeCategory: String, CaseIterable, Identifiable {
        case main, Sub, Rest
        var id: Self { self }
        var fileNames: [String] {
            switch self {
                case .main: ["App.swift",
                             "ContentView.swift",
                             "📱AppModel.swift"]
                case .Sub: ["📱AppModel(Extension).swift"]
                case .Rest: ["🗒️StaticInfo.swift",
                             "ℹ️AboutApp.swift"]
            }
        }
    }
}

#elseif os(macOS)
extension 🗒️StaticInfo {
    static let versionInfos: [(version: String, date: String)] = [("1.1", "2021-03-01"),
                                                                  ("1.0.1", "2021-02-01"),
                                                                  ("1.0", "2021-01-01")] //降順。先頭の方が新しい
    
    enum SourceCodeCategory: String, CaseIterable, Identifiable {
        case main, Sub, Rest
        var id: Self { self }
        var fileNames: [String] {
            switch self {
                case .main: ["App.swift",
                             "ContentView.swift",
                             "📱AppModel.swift"]
                case .Sub: ["📱AppModel(Extension).swift",
                            "📣ADSheet.swift",
                            "🔧Settings.swift",
                            "🪄Commands.swift",
                            "🤖AppDelegate.swift",
                            "💬RequestUserReview.swift"]
                case .Rest: ["🗒️StaticInfo.swift",
                             "ℹ️HelpWindows.swift",
                             "📣ADModel.swift",
                             "📣ADContent.swift",
                             "🛒InAppPurchaseModel.swift",
                             "🛒InAppPurchaseView.swift"]
            }
        }
    }
}
#endif
