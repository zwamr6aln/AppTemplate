
import SwiftUI

class 📱AppModel: ObservableObject {
    
}

class 🄰pplicationDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let ⓒonfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        if connectingSceneSession.role == .windowApplication {
            ⓒonfiguration.delegateClass = 🅂ceneDelegate.self
        }
        return ⓒonfiguration
    }
    
    class 🅂ceneDelegate: NSObject, UIWindowSceneDelegate {
        func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
            print(scene.debugDescription)
            print(URLContexts.first!.url.description)
        }
    }
}

let 🆔appGroupID = "group.net.aaaakkkkssssttttnnnn.AppTemplate"
