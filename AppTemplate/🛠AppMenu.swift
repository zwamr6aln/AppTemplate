import SwiftUI

struct 🛠MenuButton: View { // ⚙️
    @State private var 🚩showMenu: Bool = false
    var body: some View {
        Button {
            self.🚩showMenu = true
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        } label: {
            Label("Open menu", systemImage: "gear")
        }
        .sheet(isPresented: $🚩showMenu) {
            🛠AppMenu()
        }
    }
}

struct 🛠AppMenu: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack { ⓒontent() }
        } else {
            NavigationView {
                ⓒontent()
                    .navigationViewStyle(.stack)
            }
        }
    }
    private func ⓒontent() -> some View {
        List {
            Section {
                Toggle(isOn: .constant(false)) {
                    Label("placeholder", systemImage: "questionmark")
                }
            } header: {
                Text("Option")
            }
            ℹ️AboutAppLink(name: "AppTemplate", subtitle: "App for iPhone / iPad")
            📣ADMenuLink()
        }
        .navigationTitle("Menu")
        .toolbar { self.ⓓismissButton() }
    }
    private func ⓓismissButton() -> some View {
        Button {
            self.dismiss()
            UISelectionFeedbackGenerator().selectionChanged()
        } label: {
            Image(systemName: "chevron.down")
        }
        .tint(.secondary)
        .accessibilityLabel("Dismiss")
    }
}
