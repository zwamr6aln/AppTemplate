import SwiftUI

struct 🪄Commands: Commands {
    @Environment(\.openWindow) var openWindow
    var body: some Commands {
        CommandGroup(before: .appVisibility) {
            Button(String(localized: "In-App Purchase", table: "AD&InAppPurchase")) { self.openWindow(id: "InAppPurchase") }
            Divider()
        }
        CommandGroup(replacing: .systemServices) { EmptyView() }
        CommandGroup(replacing: .undoRedo) { EmptyView() }
        CommandGroup(replacing: .pasteboard) { EmptyView() }
        SidebarCommands()
        CommandGroup(replacing: .help) { EmptyView() }
        CommandGroup(after: .help) {
            Link(String(localized: "Open AppStore page", table: "AboutApp"), destination: 🗒️StaticInfo.appStoreProductURL)
            Link(String(localized: "Review on AppStore", table: "AboutApp"), destination: 🗒️StaticInfo.appStoreUserReviewURL)
            Divider()
            Button(String(localized: "Description", table: "AboutApp")) { self.openWindow(id: "Description") }
            Button(String(localized: "Privacy Policy", table: "AboutApp")) { self.openWindow(id: "PrivacyPolicy") }
            Button(String(localized: "Version History", table: "AboutApp")) { self.openWindow(id: "VersionHistory") }
            Divider()
            Button(String(localized: "Source code", table: "AboutApp")) { self.openWindow(id: "SourceCode") }
            Button(String(localized: "Developer / Publisher", table: "AboutApp")) { self.openWindow(id: "DeveloperPublisher") }
        }
    }
}
