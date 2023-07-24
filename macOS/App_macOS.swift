import SwiftUI

@main
struct App_macOS: App {
    @NSApplicationDelegateAdaptor var ⓓelegate: 🄳elegate
    private let 📱 = 📱AppModel()
    private let 🛒 = 🛒InAppPurchaseModel(id: "PLACEHOLDER.adfree")
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
                .environmentObject(🛒)
        }
        .commands { 🪄Commands() }
        Settings { 🔧SettingsContent() }
        ℹ️HelpWindows()
    }
}
