
import SwiftUI


@main
struct AppTemplateApp: App {
    
    let 📱 = 📱Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
        }
    }
}
