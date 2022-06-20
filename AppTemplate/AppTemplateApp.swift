
import SwiftUI


@main
struct AppTemplateApp: App {
    
    let 📱 = 📱AppModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
        }
    }
}
