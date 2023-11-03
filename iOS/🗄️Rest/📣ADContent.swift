import SwiftUI

struct 📣ADContent: View {
    @State private var pickedApp: 📣ADTargetApp = .pickUpAppWithout(.FlipByBlink)
    var body: some View {
        📣ADView(self.pickedApp, second: 9)
    }
}
