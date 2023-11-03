import SwiftUI

@main
struct IOSApp: App {
    @StateObject var model = 📱AppModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.model)
        }
    }
}
