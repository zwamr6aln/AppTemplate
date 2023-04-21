import SwiftUI

struct 🛠MenuButton: View { // ⚙️
    var body: some View {
        NavigationLink {
            🛠AppMenu()
        } label: {
            Label("Open menu", systemImage: "gear")
        }
    }
}

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
            📣ADMenuLink()
        }
        .navigationTitle("Menu")
    }
}
