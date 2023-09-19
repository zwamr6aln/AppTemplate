import SwiftUI

@main
struct AppTemplate: App {
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
        🔧Settings()
        ℹ️HelpWindows()
        🛒InAppPurchaseWindow(self.📱)
    }
}
