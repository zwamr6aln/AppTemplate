import SwiftUI

class 📱AppModel: ObservableObject {
#if os(iOS)
    @Published var showSheet: 🪧Sheet.Source? = nil
#endif
    
#if os(iOS) || os(macOS)
    let inAppPurchaseModel: 🛒InAppPurchaseModel = .init(id: "PLACEHOLDER.adfree")
#endif
}
