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
                Divider()
                NavigationLink {
                    Text("Placeholder")
                } label: {
                    Label("Option", systemImage: "gear")
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
