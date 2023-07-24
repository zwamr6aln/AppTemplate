import SwiftUI

struct ContentView: View {
    @EnvironmentObject var 📱: 📱AppModel
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink {
                    Text("Placeholder")
                        .navigationTitle("Navigation title")
                } label: {
                    Label("Placeholder", systemImage: "book")
                }
                Divider()
                NavigationLink {
                    Text("Placeholder")
                        .navigationTitle("Option")
                } label: {
                    Label("Option", systemImage: "gear")
                }
                NavigationLink {
                    📣ADMenu()
                } label: {
                    Label("In App Purchase", systemImage: "cart")
                }
            }
        } detail: {
            Text("Detail")
                .navigationTitle("AppTitle")
        }
    }
}
