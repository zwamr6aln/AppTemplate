import SwiftUI

@main
struct macOSApp: App {
    //@NSApplicationDelegateAdaptor var ⓓelegate: 🤖AppDelegate
    private let appModel = 📱AppModel()
    private let inAppPurchaseModel = 🛒InAppPurchaseModel(id: "PLACEHOLDER.adfree")
    var body: some Scene {
        Window("Main window", id: "MainWindow") {
            ContentView()
                .environmentObject(self.appModel)
                .environmentObject(self.inAppPurchaseModel)
        }
        .commands { 🪄Commands() }
        🔧Settings()
        ℹ️HelpWindows()
        🛒InAppPurchaseWindow(self.appModel)
    }
}
