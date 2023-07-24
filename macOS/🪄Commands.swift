import SwiftUI

struct 🪄Commands: Commands {
    var body: some Commands {
        CommandGroup(replacing: .systemServices) { EmptyView() }
        CommandGroup(replacing: .undoRedo) { EmptyView() }
        CommandGroup(replacing: .pasteboard) { EmptyView() }
        SidebarCommands()
        CommandGroup(replacing: .help) { EmptyView() }
        CommandGroup(after: .help) {
            Link("Link", destination: URL(string: "https://apple.com")!)
        }
    }
}
