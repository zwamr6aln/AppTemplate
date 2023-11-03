import SwiftUI

extension 📱AppModel: NSApplicationDelegate {
    func applicationDidBecomeActive(_ notification: Notification) {
        let ⓐpp = notification.object as! NSApplication
        print("🖨️ \(self), \(String(describing: ⓐpp.menu?.items))")
    }
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        false
    }
}
