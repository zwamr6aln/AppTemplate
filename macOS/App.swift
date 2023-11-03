import SwiftUI

@main
struct MacOSApp: App {
    @NSApplicationDelegateAdaptor var model: 📱AppModel
    var body: some Scene {
        Window("Primary", id: "primary") {
            ContentView()
        }
        .commands { 🪄Commands(self.model) }
        🔧Settings()
        ℹ️HelpWindows()
        🛒InAppPurchaseWindow()
    }
}
