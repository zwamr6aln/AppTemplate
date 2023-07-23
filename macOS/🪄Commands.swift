import SwiftUI

struct 🪄Commands: Commands {
    var body: some Commands {
        SidebarCommands()
        ToolbarCommands()
        CommandGroup(replacing: .systemServices) { EmptyView() }
        CommandGroup(after: .help) {
            Link("Link", destination: URL(string: "https://apple.com")!)
        }
    }
}
