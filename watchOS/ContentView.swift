import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Placeholder") { Text("Placeholder") }
                ℹ️AboutAppLink()
            }
            .navigationTitle(🗒️StaticInfo.appName)
        }
    }
}
