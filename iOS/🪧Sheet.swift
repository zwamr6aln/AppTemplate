import SwiftUI

struct 🪧Sheet: ViewModifier {
    @EnvironmentObject var model: 📱AppModel
    @EnvironmentObject var inAppPurchaseModel: 🛒InAppPurchaseModel
    func body(content: Content) -> some View {
        content
            .sheet(item: self.$model.presentedSheet) {
                switch $0 {
                    case .menu: NavigationStack { MenuPane() }
                    case .placeholder: Text("Placeholder")
                    case .ad:
                        📣ADContent()
                            .environmentObject(self.inAppPurchaseModel)
                }
            }
            .onAppear {
                if self.inAppPurchaseModel.checkToShowADSheet() { self.model.presentedSheet = .ad }
            }
    }
    enum Source: Identifiable {
        case menu, placeholder, ad
        var id: Self { self }
    }
}
