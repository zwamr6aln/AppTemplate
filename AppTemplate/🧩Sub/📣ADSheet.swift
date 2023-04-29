import SwiftUI

struct 📣ADSheet: ViewModifier {
    @EnvironmentObject private var 🛒: 🛒StoreModel
    @State private var ⓐpp: 📣MyApp = .pickUpAppWithout(.FlipByBlink)
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $🛒.🚩showADSheet) {
                📣ADView(self.ⓐpp, second: 20)
                    .environmentObject(🛒)
            }
            .onAppear {
                🛒.checkToShowADSheet()
            }
    }
}
