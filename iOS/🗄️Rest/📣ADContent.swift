import SwiftUI

struct 📣ADContent: View {
    @State private var app: 📣ADTargetApp = .pickUpAppWithout(.FlipByBlink)
    var body: some View {
        📣ADView(self.app, second: 5)
    }
}
