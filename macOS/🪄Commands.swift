import SwiftUI

struct 🪄Commands: Commands {
    @Environment(\.openWindow) var openWindow
    var body: some Commands {
        CommandGroup(replacing: .systemServices) { EmptyView() }
        CommandGroup(replacing: .undoRedo) { EmptyView() }
        CommandGroup(replacing: .pasteboard) { EmptyView() }
        SidebarCommands()
        CommandGroup(replacing: .help) { EmptyView() }
        CommandGroup(after: .help) {
            Link("AppStore link", destination: URL(string: "https://apple.com")!)
            Link("Review on AppStore", destination: URL(string: "https://apple.com")!)
            Button("Description") { self.openWindow(id: "Description") }
            Button("Privacy policy") { self.openWindow(id: "PrivacyPolicy") }
            Button("Version history") { self.openWindow(id: "VersionHistory") }
            Button("Source code") { self.openWindow(id: "SourceCode") }
            Button("Developer / Publisher") { self.openWindow(id: "DeveloperPublisher") }
        }
    }
}
