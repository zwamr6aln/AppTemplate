
import SwiftUI

struct 🛒PurchaseSheet: ViewModifier {
    @Binding var 🚩ShowPurchaseSheet: Bool
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $🚩ShowPurchaseSheet) {
                NavigationView {
                    📣ADMenu()
                        .toolbar { ﹀DismissButton($🚩ShowPurchaseSheet) }
                }
                .navigationViewStyle(StackNavigationViewStyle())
            }
    }
    init(_ 🚩ShowPurchaseSheet: Binding<Bool>) {
        self._🚩ShowPurchaseSheet = 🚩ShowPurchaseSheet
    }
}
