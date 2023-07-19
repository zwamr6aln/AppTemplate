import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @EnvironmentObject private var 🛒: 🛒StoreModel
    var body: some View {
        NavigationStack {
            List {
                Text("Placeholder")
            }
            .navigationTitle("AppTemplate")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) { 🛠MenuButton() }
            }
        }
        .modifier(🪧Sheet())
        .modifier(💬RequestUserReview())
        .modifier(🩹Workaround.hideTitleBarOnMacCatalyst())
    }
}
