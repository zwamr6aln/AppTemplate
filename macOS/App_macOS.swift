import SwiftUI

@main
struct App_macOS: App {
    @NSApplicationDelegateAdaptor var ⓓelegate: 🄳elegate
    private let 📱 = 📱AppModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
        }
        .commands { 🪄Commands() }
        Settings { 🔧SettingsContent() }
        ℹ️HelpWindows()
    }
}
