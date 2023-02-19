import SwiftUI
import StoreKit

struct ContentView: View {
    @EnvironmentObject var 📱: 📱AppModel
    @EnvironmentObject var 🛒: 🛒StoreModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        if #available(iOS 16.0, *) {
            Group {
                if self.horizontalSizeClass == .compact {
                    NavigationStack { self.ⓒontent() }
                } else {
                    NavigationSplitView(columnVisibility: .constant(.all)) {
                        self.ⓒontent()
                    } detail: {
                        Image(systemName: "questionmark")
                            .font(.largeTitle)
                            .foregroundStyle(.tertiary)
                    }
                }
            }
        } else {
            NavigationView { self.ⓒontent() }
                .navigationViewStyle(.stack)
        }
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
