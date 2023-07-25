import SwiftUI

struct 🛠AppMenu: View {
    var body: some View {
        List {
            Section {
                Toggle(isOn: .constant(false)) {
                    Label("placeholder", systemImage: "questionmark")
                }
            } header: {
                Text("Option")
            }
            ℹ️AboutAppLink()
            🛒InAppPurchaseMenuLink()
        }
        .navigationTitle("Menu")
    }
}
