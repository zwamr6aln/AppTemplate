import SwiftUI

struct 📣ADSheet: ViewModifier {
    @EnvironmentObject var 🛒: 🛒InAppPurchaseModel
    @State private var app: 📣ADTargetApp = .pickUpAppWithout(.FlipByBlink)
    @State private var showSheet: Bool = false
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: self.$showSheet) {
                📣ADContent(self.app, second: 5)
                    .environmentObject(🛒)
            }
            .task {
                try? await Task.sleep(for: .seconds(0.5))
                if 🛒.checkToShowADSheet() { self.showSheet = true }
            }
    }
}
