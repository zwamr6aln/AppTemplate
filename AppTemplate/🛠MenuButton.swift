
import SwiftUI

struct 🛠MenuButton: View { // ⚙️
    @State private var 🚩ShowMenu: Bool = true
    var body: some View {
        Button {
            🚩ShowMenu = true
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        } label: {
            Label("Open menu", systemImage: "gear")
        }
        .sheet(isPresented: $🚩ShowMenu) {
            🛠AppMenu()
        }
    }
}
