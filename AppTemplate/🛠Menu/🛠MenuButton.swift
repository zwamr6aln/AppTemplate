
import SwiftUI

struct 🛠MenuButton: View {
    @State private var 🚩ShowMenu = false
    
    var body: some View {
        Button {
            🚩ShowMenu = true
            UISelectionFeedbackGenerator().selectionChanged()
        } label: {
            Label("Open menu", systemImage: "gear")
        }
        .sheet(isPresented: $🚩ShowMenu) {
            🛠MenuSheet()
                .onDisappear {
                    🚩ShowMenu = false
                }
        }
    }
}
