import SwiftUI

struct 🔧SettingsContent: View {
    var body: some View {
        TabView {
            Form {
                Toggle("Toggle", isOn: .constant(false))
                Picker("Picker", selection: .constant(1)) {
                    Text("1").tag(1); Text("2").tag(2); Text("3").tag(3);
                }
                Link("Link", destination: URL(string: "http://apple.com")!)
            }
            .padding()
            .tabItem { Label("1", systemImage: "1.circle") }
            Text("2")
                .tabItem { Label("2", systemImage: "2.circle") }
        }
        .frame(minWidth: 300, minHeight: 200)
    }
}
