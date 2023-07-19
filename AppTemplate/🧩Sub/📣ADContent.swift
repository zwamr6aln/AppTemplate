import SwiftUI

struct 📣ADContent: View {
    @EnvironmentObject private var 🛒: 🛒StoreModel
    @State private var app: 📣MyApp = .pickUpAppWithout(.FlipByBlink)
    var body: some View {
        📣ADView(self.app, second: 10)
            .environmentObject(🛒)
    }
}
