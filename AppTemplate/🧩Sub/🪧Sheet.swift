import SwiftUI

struct 🪧Sheet: ViewModifier {
    @EnvironmentObject private var 📱: 📱AppModel
    @EnvironmentObject private var 🛒: 🛒StoreModel
    func body(content: Content) -> some View {
        content
            .sheet(item: $📱.showSheet) {
                switch $0 {
                    case .AD: 📣ADContent()
                    case .Menu: 🛠AppMenu()
                    case .Placeholder: Text("Placeholder")
                }
            }
            .onAppear {
                if 🛒.checkToShowADSheet() { 📱.showSheet = .AD }
            }
    }
    enum 🄲ategory: Identifiable {
        case AD, Menu, Placeholder
        var id: Self { self }
    }
}
