import SwiftUI

@main
struct VisionOSApp: App {
    @StateObject var model = 📱AppModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.model)
        }
    }
}
