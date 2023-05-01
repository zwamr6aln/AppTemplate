import SwiftUI
import StoreKit

struct ContentView: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @EnvironmentObject private var 🛒: 🛒StoreModel
    var body: some View {
        🗄️NavigationStack {
            List {
                Text("Placeholder")
            }
            .navigationTitle("ContentView")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    🛠MenuButton()
                }
            }
        }
        .modifier(🪧Sheet())
        .modifier(💬RequestUserReview())
        .modifier(🩹Workaround.hideTitleBarOnMacCatalyst())
    }
}
