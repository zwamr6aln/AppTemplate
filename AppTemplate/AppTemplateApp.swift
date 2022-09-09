
import SwiftUI

@main
struct AppTemplateApp: App {
    
    let 📱 = 📱AppModel()
    let 🛒 = 🛒StoreModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
                .environmentObject(🛒)
        }
    }
}
