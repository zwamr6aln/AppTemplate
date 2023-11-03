import SwiftUI

@main
struct MacOSApp: App {
    @NSApplicationDelegateAdaptor var model: 📱AppModel
    var body: some Scene {
        Window("Primary", id: "primary") {
            ContentView()
        }
        .commands { 🪄Commands() }
        🔧Settings()
        ℹ️HelpWindows()
        🛒InAppPurchaseWindow()
    }
}
