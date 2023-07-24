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
        Window("Privacy Policy", id: "PrivacyPolicy") { 👤PrivacyPolicyContent() }
        Settings { 🔧SettingsContent() }
    }
}

class 🄳elegate: NSObject, NSApplicationDelegate {
    func applicationDidBecomeActive(_ notification: Notification) {
        let ⓐpp = notification.object as! NSApplication
        print("🖨️ \(self), \(String(describing: ⓐpp.menu?.items))")
    }
}

class 📱AppModel: ObservableObject {
    @Published var showSheet: Bool = false
}
