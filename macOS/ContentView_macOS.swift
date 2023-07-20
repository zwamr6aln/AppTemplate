import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink {
                    🛠AppMenu()
                } label: {
                    Label("Option", systemImage: "gearshape")
                }
                NavigationLink {
                    TrialView()
                } label: {
                    Label("Trial", systemImage: "questionmark.app")
                }
                Section {
                    NavigationLink("Navi link") { Text("Text") }
                } header: {
                    Text("Section header title")
                }
                DisclosureGroup("DisclosureGroup", isExpanded: .constant(true)) {
                    ShareLink(item: "ShareLink")
                    Toggle("Toggle", isOn: .constant(false))
                    Menu("Menu") { Text("1"); Text("2") }
                    Picker("Picker", selection: .constant("1")) { Text("1"); Text("2") }
                    Button("Button") {}
                    Text("Text")
                }
            }
        } detail: {
            Text("Detail")
                .navigationTitle("AppTitle")
        }
    }
}

struct TrialView: View {
    @State private var showSheet: Bool = false
    @State private var showPopOver: Bool = false
    @State private var showAlert: Bool = false
    @State private var showCD: Bool = false
    var body: some View {
        List {
            Button("Show sheet") { self.showSheet = true }
                .sheet(isPresented: self.$showSheet) {
                    Text("Placeholder")
                        .padding()
                }
            Button("Show pop over") { self.showPopOver = true }
                .popover(isPresented: self.$showPopOver) {
                    Text("Placeholder")
                        .padding()
                }
            Button("Show alert") { self.showAlert = true }
                .alert("alert", isPresented: self.$showAlert) { EmptyView() }
            Button("Show CD") { self.showCD = true }
                .confirmationDialog("confirmationDialog", isPresented: self.$showCD) { EmptyView() }
        }
        .toolbar {
            ShareLink(item: "a")
            Button(action: {}) { Label("label", systemImage: "xmark") }
        }
        .navigationTitle("Trial")
        
    }
}

struct 🛠AppMenu: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Toggle(isOn: .constant(false)) {
                        Label("placeholder", systemImage: "questionmark")
                    }
                } header: {
                    Text("Category1")
                }
            }
            .navigationTitle("Option")
        }
    }
}
