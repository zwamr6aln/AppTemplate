import SwiftUI

struct ContentView: View {
    @EnvironmentObject var 📱: 📱AppModel
    @EnvironmentObject var 🛒: 🛒InAppPurchaseModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        Group {
            if self.horizontalSizeClass == .compact {
                NavigationStack {
                    Text(verbatim: "Placeholder")
                        .navigationTitle("AppTemplate")
                        .toolbar {
                            NavigationLink {
                                Self.menu()
                            } label: { Label("Open menu", systemImage: "gear") }
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
                        } label: { Label("Option", systemImage: "gear") }
                        NavigationLink {
                            NavigationStack { Self.menu() }
                        } label: { Label("Menu", systemImage: "gearshape") }
                        NavigationLink {
                            NavigationStack {
                                List {
                                    ℹ️IconAndName()
                                    ℹ️AboutAppContent()
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
            }
        }
        .modifier(🪧Sheet())
        .modifier(💬RequestUserReview())
        .modifier(🩹Workaround.HideTitleBarOnMacCatalyst())
    }
}




extension ContentView {
    private static func menu() -> some View {
        List {
            Text(verbatim: "Placeholder")
            Section {
                ℹ️IconAndName()
                ℹ️AppStoreLink()
                NavigationLink {
                    List { ℹ️AboutAppContent() }
                        .navigationTitle(String(localized: "About App", table: "🌐AboutApp"))
                } label: {
                    Label(String(localized: "About App", table: "🌐AboutApp"),
                          systemImage: "doc")
                }
            }
            🛒InAppPurchaseMenuLink()
        }
        .navigationTitle("Menu")
    }
}
