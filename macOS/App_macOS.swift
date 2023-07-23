import SwiftUI

@main
struct App_macOS: App {
    private let 📱 = 📱AppModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
        }
        .commands { 🪄Commands() }
        Settings { 🔧SettingsContent() }
    }
}

class 📱AppModel: ObservableObject {
    @Published var showSheet: Bool = false
}
