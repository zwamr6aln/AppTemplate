import SwiftUI

class 🤖AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidBecomeActive(_ notification: Notification) {
        let ⓐpp = notification.object as! NSApplication
        print("🖨️ \(self), \(String(describing: ⓐpp.menu?.items))")
    }
}
