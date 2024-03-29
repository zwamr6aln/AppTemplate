import SwiftUI

class 📱AppModel: NSObject, ObservableObject {
#if os(iOS) || os(visionOS)
    @Published var presentedSheet: 🪧Sheet.Source? = nil
#endif
    
#if os(iOS) || os(macOS) || os(visionOS)
    let inAppPurchaseModel: 🛒InAppPurchaseModel = .init(id: "PLACEHOLDER.adfree")
#endif
}
