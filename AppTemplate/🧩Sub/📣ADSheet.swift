import SwiftUI

struct 📣ADSheet: ViewModifier {
    @EnvironmentObject private var 🛒: 🛒StoreModel
    @State private var ⓐpp: 📣MyApp = .pickUpAppWithout(.FlipByBlink)
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $🛒.🚩showADSheet) {
                📣ADView(self.ⓐpp, second: 9)
                    .environmentObject(🛒)
            }
            .onAppear {
                🛒.checkToShowADSheet()
            }
    }
}
