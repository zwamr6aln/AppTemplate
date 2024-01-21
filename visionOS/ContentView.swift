import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: 📱AppModel
    @State private var presentAboutApp: Bool = true
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
                Button {
                    self.presentAboutApp.toggle()
                } label: {
                    Label(String(localized: "About App", table: "🌐AboutApp"),
                          systemImage: "doc")
                }
            }
            .navigationTitle("AppTemplate")
        } detail: {
            Text(verbatim: "Detail")
                .help("Help Content")
                .padding()
                .background(in: .rect(cornerRadius: 12, style: .continuous))
        }
        .frame(minWidth: 800)
        .sheet(isPresented: self.$presentAboutApp) { ℹ️AboutAppMenu() }
    }
}
