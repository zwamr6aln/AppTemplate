import SwiftUI

struct ContentView: View {
    @EnvironmentObject var 📱: 📱AppModel
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink {
                    TrialView()
                } label: {
                    Label("Trial", systemImage: "questionmark.app")
                }
                NavigationLink {
                    ℹ️AboutAppMenu()
                } label: {
                    Label("About", systemImage: "questionmark")
                }
                Divider()
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
                    Text("EnvironmentObject/📱.showSheet: " + self.📱.showSheet.description)
                }
            }
        } content: {
            Text("Content")
                .navigationTitle("AppTitle")
        } detail: {
            Text("Detail")
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
                    Text("Placeholder").padding()
                }
            Button("Show pop over") { self.showPopOver = true }
                .popover(isPresented: self.$showPopOver) {
                    Text("Placeholder").padding()
                }
            Button("Show alert") { self.showAlert = true }
                .alert("alert", isPresented: self.$showAlert) {}
            Button("Show CD") { self.showCD = true }
                .confirmationDialog("confirmationDialog", isPresented: self.$showCD) {}
            LabeledContent("titleKey", value: "value")
            NavigationLink {
                Text("\(Date.now)")
            } label: {
                Label("NavigationLink", systemImage: "1.circle")
            }
        }
        .toolbar {
            ShareLink(item: "a")
            Button(action: {}) { Label("label", systemImage: "xmark") }
        }
        .navigationTitle("Trial")
        
    }
}
