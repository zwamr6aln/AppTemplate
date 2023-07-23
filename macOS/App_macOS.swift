import SwiftUI

@main
struct App_macOS: App {
    private let 📱 = 📱AppModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
        }
        Settings { 🔧SettingsContent() }
    }
}

class 📱AppModel: ObservableObject {
    @Published var showSheet: Bool = false
}
