import SwiftUI

@main
struct AppTemplate: App {
    private let 📱 = 📱AppModel()
    private let 🛒 = 🛒InAppPurchaseModel(id: "PLACEHOLDER2.adfree")
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
                .environmentObject(🛒)
        }
    }
}
