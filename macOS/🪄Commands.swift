import SwiftUI

struct 🪄Commands: Commands {
    @ObservedObject var model: 📱AppModel
    var body: some Commands {
        🛒InAppPurchaseCommand()
        CommandGroup(replacing: .systemServices) { EmptyView() }
        CommandGroup(replacing: .undoRedo) { EmptyView() }
        CommandGroup(replacing: .pasteboard) { EmptyView() }
        SidebarCommands()
        ℹ️HelpCommands()
    }
    init(_ model: 📱AppModel) {
        self.model = model
    }
}
