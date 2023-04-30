import SwiftUI

struct 📣ADContent: View {
    @EnvironmentObject private var 🛒: 🛒StoreModel
    @State private var ⓐpp: 📣MyApp = .pickUpAppWithout(.FlipByBlink)
    var body: some View {
        📣ADView(self.ⓐpp, second: 20)
            .environmentObject(🛒)
    }
}
