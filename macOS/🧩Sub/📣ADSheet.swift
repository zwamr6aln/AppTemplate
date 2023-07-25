import SwiftUI

struct 📣ADSheet: ViewModifier {
    @EnvironmentObject var 🛒: 🛒InAppPurchaseModel
    @State private var app: 📣ADTargetApp = .pickUpAppWithout(.FlipByBlink)
    @State private var showSheet: Bool = false
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: self.$showSheet) {
                📣ADView(self.app, second: 5)
                    .environmentObject(🛒)
            }
            .onAppear {
                if 🛒.checkToShowADSheet() { self.showSheet = true }
            }
    }
}
