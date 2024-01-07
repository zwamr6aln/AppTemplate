import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @EnvironmentObject var model: 📱AppModel
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink {
                    NavigationStack {
                        Form {
                            Toggle("Toggle", isOn: .constant(false))
                        }
                        .navigationTitle("Option")
                    }
                } label: {
                    Label("Option", systemImage: "gear")
                }
                NavigationLink {
                    NavigationStack {
                        List {
                            Text(verbatim: "Placeholder")
                        }
                        .navigationTitle("Menu")
                    }
                } label: {
                    Label("Menu", systemImage: "gearshape")
                }
                NavigationLink {
                    NavigationStack {
                        List {
                            Text(verbatim: "Placeholder")
                        }
                        .navigationTitle(String(localized: "About App", table: "🌐AboutApp"))
                    }
                } label: {
                    Label(String(localized: "About App", table: "🌐AboutApp"),
                          systemImage: "doc")
                }
            }
            .navigationTitle("AppTemplate")
        } detail: {
            Text(verbatim: "Detail")
        }
        .frame(minWidth: 800)
    }
}
