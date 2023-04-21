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
        .modifier(💬RequestUserReview())
        .modifier(🩹Workaround.hideTitleBarOnMacCatalyst())
    }
    private func ⓒontent() -> some View {
        List {
            Text("Placeholder")
            Button("支払い済みでなければ広告シートを表示する") {
                🛒.checkToShowADSheet()
            }
        }
        .navigationTitle("ContentView")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                🛠MenuButton()
            }
        }
    }
}
