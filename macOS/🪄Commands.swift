import SwiftUI

struct 🪄Commands: Commands {
    var body: some Commands {
        🛒InAppPurchaseCommand()
        CommandGroup(replacing: .systemServices) { EmptyView() }
        CommandGroup(replacing: .undoRedo) { EmptyView() }
        CommandGroup(replacing: .pasteboard) { EmptyView() }
        SidebarCommands()
        ℹ️HelpCommands()
    }
}
