import SwiftUI

struct 📣ADContent: ViewModifier {
    @EnvironmentObject var 🛒: 🛒StoreModel
    @State private var ⓐpp: 📣MyApp = .pickUpAppWithout(.FlipByBlink)
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $🛒.🚩showADSheet) {
                📣ADSheet(ⓐpp)
            }
            .onAppear { 🛒.🚩showADSheet = true }
    }
}
