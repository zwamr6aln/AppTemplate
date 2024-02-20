import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Placeholder") { Text("Placeholder") }
                NavigationLink {
                    ℹ️AboutAppMenu()
                } label: {
                    Label("About App", systemImage: "questionmark")
                }
            }
            .navigationTitle(String(localized: 🗒️StaticInfo.appName))
        }
    }
}
