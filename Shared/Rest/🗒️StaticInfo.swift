import SwiftUI

enum 🗒️StaticInfo {
    static let appName: LocalizedStringResource = "AppTemplate"
    static var appSubTitle: LocalizedStringResource {
        """
        iPhone, iPad, Apple Watch,
        Mac, Apple TV, Apple Vision Pro
        """
    }
    
    static let appStoreProductURL: URL = .init(string: "https://apps.apple.com/app/id?")!
    static var appStoreUserReviewURL: URL { .init(string: "\(Self.appStoreProductURL)?action=write-review")! }
    
    static var contactAddress: String { "sear_pandora_0x@icloud.com" }
    
    static let privacyPolicyDescription = """
        2024-❓-❓
        
        
        English
        
        This application don't collect user infomation.
        
        
        日本語(Japanese)
        
        このアプリ自身において、ユーザーの情報を一切収集しません。
        """
    
    static let webRepositoryURL: URL = .init(string: "https://github.com/FlipByBlink/?")!
    static let webMirrorRepositoryURL: URL = .init(string: "https://gitlab.com/FlipByBlink/?_Mirror")!
}

#if os(iOS)
extension 🗒️StaticInfo {
    static let versionInfos: [(version: String, date: String)] = [("1.1", "2021-03-01"),
                                                                  ("1.0.1", "2021-02-01"),
                                                                  ("1.0", "2021-01-01")] //降順。先頭の方が新しい
    
    enum SourceCodeCategory: String, CaseIterable, Identifiable {
        case main, Rest, Widget
        var id: Self { self }
        var fileNames: [String] {
            switch self {
                case .main: [
                    "App.swift",
                    "ContentView.swift",
                    "📱AppModel.swift",
                    "📱AppModel(extension).swift"
                ]
                case .Rest: [
                    "🪧Sheet.swift",
                    "📣ADContent.swift",
                    "💬RequestUserReview.swift",
                    "🩹Workaround.swift",
                    "🗒️StaticInfo.swift",
                    "ℹ️AboutApp.swift",
                    "📣ADModel.swift",
                    "📣ADComponents.swift",
                    "🛒InAppPurchaseModel.swift",
                    "🛒InAppPurchaseView.swift"
                ]
                case .Widget: [
                    "Widget.swift"
                ]
            }
        }
    }
}

#elseif os(watchOS)
extension 🗒️StaticInfo {
    enum SourceCodeCategory: String, CaseIterable, Identifiable {
        case main, Rest, Widget
        var id: Self { self }
        var fileNames: [String] {
            switch self {
                case .main: [
                    "App.swift",
                    "ContentView.swift",
                    "📱AppModel.swift",
                    "📱AppModel(extension).swift"
                ]
                case .Rest: [
                    "🗒️StaticInfo.swift",
                    "ℹ️AboutApp.swift"
                ]
                case .Widget: [
                    "Widget.swift"
                ]
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
        case main, Rest, Widget
        var id: Self { self }
        var fileNames: [String] {
            switch self {
                case .main: [
                    "App.swift",
                    "ContentView.swift",
                    "📱AppModel.swift",
                    "📱AppModel(extension).swift"
                ]
                case .Rest: [
                    "📣ADSheet.swift",
                    "🔧Settings.swift",
                    "🪄Commands.swift",
                    "💬RequestUserReview.swift",
                    "🗒️StaticInfo.swift",
                    "ℹ️HelpWindows.swift",
                    "ℹ️HelpCommands.swift",
                    "📣ADModel.swift",
                    "📣ADContent.swift",
                    "🛒InAppPurchaseModel.swift",
                    "🛒InAppPurchaseWindow.swift",
                    "🛒InAppPurchaseMenu.swift",
                    "🛒InAppPurchaseCommand.swift"
                ]
                case .Widget: [
                    "Widget.swift"
                ]
            }
        }
    }
}

#elseif os(visionOS)
extension 🗒️StaticInfo {
    static let versionInfos: [(version: String, date: String)] = [("1.0", "2024-02-02")] //降順。先頭の方が新しい
    
    enum SourceCodeCategory: String, CaseIterable, Identifiable {
        case main, Rest
        var id: Self { self }
        var fileNames: [String] {
            switch self {
                case .main: [
                    "App.swift",
                    "ContentView.swift",
                    "📱AppModel.swift"
                ]
                case .Rest: [
                    "🗒️StaticInfo.swift",
                    "ℹ️AboutApp.swift",
                    "ℹ️AboutAppMenu+Tab.swift"
                ]
            }
        }
    }
}
#endif
