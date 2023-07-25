import SwiftUI

struct ContentView: View {
    @EnvironmentObject var 📱: 📱AppModel
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink {
                    Text("Placeholder")
                        .navigationTitle("Placeholder")
                } label: {
                    Label("Placeholder", systemImage: "book")
                }
                Divider()
                NavigationLink {
                    List { Toggle("Toggle", isOn: .constant(false)) }
                        .navigationTitle("Option")
                } label: {
                    Label("Option", systemImage: "gear")
                }
            }
        } detail: {
            Text("Detail")
                .navigationTitle("No select")
        }
        .modifier(📣ADSheet())
    }
}
