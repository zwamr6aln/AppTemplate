import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink {
                    NavigationStack { 🛠AppMenu() }
                } label: {
                    Label("Open menu", systemImage: "gear")
                }
                Section {
                    NavigationLink("Navi link1") { Text("1") }
                    Text("Text")
                } header: {
                    Text("Section header title")
                }
                DisclosureGroup("DisclosureGroup", isExpanded: .constant(true)) {
                    ShareLink(item: "ShareLink")
                    Toggle("Toggle", isOn: .constant(false))
                    Menu("Menu") { Text("1"); Text("2") }
                    Picker("Picker", selection: .constant("1")) { Text("1"); Text("2") }
                    Button("Button") {}
                }
            }
            .navigationTitle("AppTemplate")
        } detail: {
            Text("Detail")
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
        }
        .navigationTitle("Menu")
    }
}
