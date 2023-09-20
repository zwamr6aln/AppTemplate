import SwiftUI

@main
struct macOSApp: App {
    @NSApplicationDelegateAdaptor var model: 📱AppModel
    var body: some Scene {
        Window("Main window", id: "MainWindow") {
            ContentView()
        }
        .commands { 🪄Commands() }
        🔧Settings()
        ℹ️HelpWindows()
        🛒InAppPurchaseWindow()
    }
}
