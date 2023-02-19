import SwiftUI

@main
struct AppTemplateApp: App {
    @UIApplicationDelegateAdaptor private var ⓓelegate: 🄰pplicationDelegate
    @StateObject private var 📱 = 📱AppModel()
    @StateObject private var 🛒 = 🛒StoreModel(id: "PLACEHOLDER.adfree")
    private let 💾 = UserDefaults(suiteName: "group.net.aaaakkkkssssttttnnnn.AppTemplate")
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modifier(📣ADContent())
                .modifier(💬RequestUserReviewOnLaunch())
                .environmentObject(📱)
                .environmentObject(🛒)
                .defaultAppStorage(💾 ?? UserDefaults())
        }
    }
}
