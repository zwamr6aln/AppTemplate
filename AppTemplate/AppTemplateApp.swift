import SwiftUI

@main
struct AppTemplateApp: App {
    @UIApplicationDelegateAdaptor private var ⓓelegate: 🄰pplicationDelegate
    @StateObject private var 📱 = 📱AppModel()
    @StateObject private var 🛒 = 🛒StoreModel(id: "PLACEHOLDER.adfree")
    private let 💾 = UserDefaults(suiteName: 🆔appGroupID) ?? UserDefaults()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modifier(📣ADContent())
                .modifier(💬RequestUserReviewOnLaunch())
                .environmentObject(📱)
                .environmentObject(🛒)
                .defaultAppStorage(💾)
        }
    }
}

let 🆔appGroupID = "group.net.aaaakkkkssssttttnnnn.AppTemplate"

enum 🏷️ {
    static let appGroupID = "group.net.aaaakkkkssssttttnnnn.AppTemplate"
    static let inAppPurchaseProductID = "PLACEHOLDER.adfree"
}
