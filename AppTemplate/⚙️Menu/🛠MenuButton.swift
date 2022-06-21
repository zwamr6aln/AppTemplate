
import SwiftUI

struct 🛠MenuButton: View {
    @EnvironmentObject var 📱: 📱AppModel
    
    var body: some View {
        Button {
            UISelectionFeedbackGenerator().selectionChanged()
            📱.🚩ShowMenu = true
        } label: {
            Label("Open menu", systemImage: "gear")
        }
        .sheet(isPresented: $📱.🚩ShowMenu) {
            🛠MenuSheet()
                .onDisappear {
                    📱.🚩ShowMenu = false
                }
        }
    }
}
