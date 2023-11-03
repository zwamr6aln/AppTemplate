import SwiftUI

struct 🪧Sheet: ViewModifier {
    @EnvironmentObject var model: 📱AppModel
    @EnvironmentObject var inAppPurchaseModel: 🛒InAppPurchaseModel
    func body(content: Content) -> some View {
        content
            .sheet(item: $model.presentedSheet) {
                switch $0 {
                    case .menu: Text("Menu")
                    case .placeholder: Text("Placeholder")
                    case .ad:
                        📣ADContent()
                            .environmentObject(self.inAppPurchaseModel)
                }
            }
            .onAppear {
                if self.inAppPurchaseModel.checkToShowADSheet() { model.presentedSheet = .ad }
            }
    }
    enum Source: Identifiable {
        case menu, placeholder, ad
        var id: Self { self }
    }
}
