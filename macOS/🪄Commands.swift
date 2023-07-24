import SwiftUI

struct 🪄Commands: Commands {
    var body: some Commands {
        SidebarCommands()
        CommandGroup(replacing: .undoRedo) { EmptyView() }
        CommandGroup(replacing: .systemServices) { EmptyView() }
        CommandGroup(replacing: .pasteboard) { EmptyView() }
        CommandGroup(after: .help) {
            Link("Link", destination: URL(string: "https://apple.com")!)
        }
    }
}
