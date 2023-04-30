import SwiftUI
import StoreKit

struct ContentView: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @EnvironmentObject private var 🛒: 🛒StoreModel
    var body: some View {
        Group {
            if #available(iOS 16.0, *) {
                NavigationStack { self.ⓒontent() }
            } else {
                NavigationView { self.ⓒontent() }
                    .navigationViewStyle(.stack)
            }
        }
        .modifier(🪧Sheet())
        .modifier(💬RequestUserReview())
        .modifier(🩹Workaround.hideTitleBarOnMacCatalyst())
    }
    private func ⓒontent() -> some View {
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
}
