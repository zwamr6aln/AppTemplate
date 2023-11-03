import SwiftUI

@main
struct IOSApp: App {
    @StateObject var model = 📱AppModel()
    @StateObject var inAppPurchaseModel = 🛒InAppPurchaseModel(id: "PLACEHOLDER.adfree")
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.model)
                .environmentObject(self.inAppPurchaseModel)
        }
    }
}
