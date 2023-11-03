import SwiftUI

@main
struct IOSApp: App {
    private let 📱 = 📱AppModel()
    private let 🛒 = 🛒InAppPurchaseModel(id: "PLACEHOLDER.adfree")
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
                .environmentObject(🛒)
        }
    }
}
