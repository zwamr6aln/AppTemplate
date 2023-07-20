import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @EnvironmentObject private var 🛒: 🛒StoreModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        Group {
            if self.horizontalSizeClass == .compact {
                NavigationStack {
                    Text("Placeholder")
                        .navigationTitle("AppTemplate")
                        .toolbar {
                            NavigationLink {
                                🛠AppMenu()
                            } label: {
                                Label("Open menu", systemImage: "gear")
                            }
                        }
                }
            } else {
                NavigationSplitView {
                    List {
                        NavigationLink {
                            NavigationStack { 🛠AppMenu() }
                        } label: {
                            Label("Open menu", systemImage: "gear")
                        }
                        Section {
                            NavigationLink("Navi link1") { Text("1") }
                            Text("Text")
                        } header: {
                            Text("Section header title")
                        }
                        DisclosureGroup("DisclosureGroup", isExpanded: .constant(true)) {
                            EditButton()
                            ShareLink(item: "ShareLink")
                            Toggle("Toggle", isOn: .constant(false))
                            Menu("Menu") { Text("1"); Text("2") }
                            Picker("Picker", selection: .constant("1")) { Text("1"); Text("2") }
                            Button("Button") {}
                        }
                    }
                    .navigationTitle("AppTemplate")
                } detail: {
                    Text("Detail")
                }
            }
        }
        .modifier(🪧Sheet())
        .modifier(💬RequestUserReview())
        .modifier(🩹Workaround.hideTitleBarOnMacCatalyst())
    }
}
