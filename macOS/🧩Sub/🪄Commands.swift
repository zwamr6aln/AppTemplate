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
            Link("AppStore link", destination: 🗒️StaticInfo.appStoreProductURL)
            Link("Review on AppStore", destination: 🗒️StaticInfo.appStoreUserReviewURL)
            Divider()
            Button("Description") { self.openWindow(id: "Description") }
            Button("Privacy policy") { self.openWindow(id: "PrivacyPolicy") }
            Button("Version history") { self.openWindow(id: "VersionHistory") }
            Divider()
            Button("Source code") { self.openWindow(id: "SourceCode") }
            Button("Developer / Publisher") { self.openWindow(id: "DeveloperPublisher") }
        }
    }
}
