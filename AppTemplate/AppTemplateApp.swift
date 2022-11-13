
import SwiftUI

@main
struct AppTemplateApp: App {
    @UIApplicationDelegateAdaptor private var ⓓelegate: 🄰pplicationDelegate
    @StateObject private var 📱 = 📱AppModel()
    @StateObject private var 🛒 = 🛒StoreModel(id: "PLACEHOLDER.adfree")
    let 💾 = UserDefaults(suiteName: "group.net.aaaakkkkssssttttnnnn.AppTemplate") ?? UserDefaults()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
                .environmentObject(🛒)
                .defaultAppStorage(💾)
        }
    }
}
