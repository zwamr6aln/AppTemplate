import SwiftUI

@main
struct App_iOS: App {
    private let 📱 = 📱AppModel()
    private let 🛒 = 🛒StoreModel(id: "PLACEHOLDER.adfree")
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
                .environmentObject(🛒)
        }
    }
}
