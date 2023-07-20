import SwiftUI

struct 🪧Sheet: ViewModifier {
    @EnvironmentObject private var 📱: 📱AppModel
    @EnvironmentObject private var 🛒: 🛒StoreModel
    func body(content: Content) -> some View {
        content
            .sheet(item: $📱.showSheet) {
                switch $0 {
                    case .Menu: 🛠AppMenu()
                    case .Placeholder: Text("Placeholder")
                    case .AD:
                        📣ADContent()
                            .environmentObject(🛒)
                }
            }
            .onAppear {
                if 🛒.checkToShowADSheet() { 📱.showSheet = .AD }
            }
    }
    enum Source: Identifiable {
        case Menu, Placeholder, AD
        var id: Self { self }
    }
}
