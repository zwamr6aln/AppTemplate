import SwiftUI

@main
struct AppTemplateApp: App {
    @StateObject private var 📱 = 📱AppModel()
    @StateObject private var 🛒 = 🛒StoreModel(id: "PLACEHOLDER.adfree")
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
                .environmentObject(🛒)
        }
    }
}
