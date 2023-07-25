import SwiftUI

struct ContentView: View {
    @EnvironmentObject var 📱: 📱AppModel
    @EnvironmentObject var 🛒: 🛒InAppPurchaseModel
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
                            NavigationStack {
                                Form { Toggle("Toggle", isOn: .constant(false)) }
                                    .navigationTitle("Option")
                            }
                        } label: {
                            Label("Option", systemImage: "gear")
                        }
                        NavigationLink {
                            NavigationStack { 🛠AppMenu() }
                        } label: {
                            Label("Menu", systemImage: "gearshape")
                        }
                        NavigationLink {
                            NavigationStack { ℹ️AboutAppMenu(withSidebarLayout: true) }
                        } label: {
                            Label("About", systemImage: "questionmark")
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
        .modifier(🩹Workaround.HideTitleBarOnMacCatalyst())
    }
}
