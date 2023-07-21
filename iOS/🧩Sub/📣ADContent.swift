import SwiftUI

struct 📣ADContent: View {
    @EnvironmentObject var 🛒: 🛒StoreModel
    @State private var app: 📣MyApp = .pickUpAppWithout(.FlipByBlink)
    var body: some View {
        📣ADView(self.app, second: 5)
            .environmentObject(🛒)
    }
}
