
import SwiftUI

@main
struct AppTemplateApp: App {
    
    let 📱 = 📱AppModel()
    let 🛒 = 🛒StoreModel(id: "PLACEHOLDER.adfree")
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
                .environmentObject(🛒)
        }
    }
}
