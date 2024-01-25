import SwiftUI

struct 🪧Sheet: ViewModifier {
    @EnvironmentObject var model: 📱AppModel
    @EnvironmentObject var inAppPurchaseModel: 🛒InAppPurchaseModel
    func body(content: Content) -> some View {
        content
            .sheet(item: self.$model.presentedSheet) {
                switch $0 {
                    case .menu:
#if os(iOS)
                        NavigationStack { MenuPane() }
#elseif os(visionOS)
                        Text(verbatim: "MENU")
#endif
                    case .placeholder: Text("Placeholder")
                    case .ad:
                        📣ADContent()
                            .environmentObject(self.inAppPurchaseModel)
                }
            }
            .task {
                try? await Task.sleep(for: .seconds(1))
                if self.inAppPurchaseModel.checkToShowADSheet() { self.model.presentedSheet = .ad }
            }
    }
    enum Source: Identifiable {
        case menu, placeholder, ad
        var id: Self { self }
    }
}
