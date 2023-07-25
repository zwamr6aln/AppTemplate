import SwiftUI

@main
struct App_macOS: App {
    //@NSApplicationDelegateAdaptor var ⓓelegate: 🤖AppDelegate
    private let 📱 = 📱AppModel()
    private let 🛒 = 🛒InAppPurchaseModel(id: "PLACEHOLDER.adfree")
    var body: some Scene {
        Window("Main window", id: "MainWindow") {
            ContentView()
                .environmentObject(📱)
                .environmentObject(🛒)
        }
        .commands { 🪄Commands() }
        Settings { 🔧SettingsContent() }
        ℹ️HelpWindows()
        🛒InAppPurchaseWindow(🛒)
    }
}
