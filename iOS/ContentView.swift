import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: 📱AppModel
    @EnvironmentObject var inAppPurchaseModel: 🛒InAppPurchaseModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var showMenuSheet: Bool = false
    var body: some View {
        Group {
            if self.horizontalSizeClass == .compact {
                NavigationStack {
                    List {
                        Text(verbatim: "Placeholder")
                        Button("Show menu sheet") { self.showMenuSheet = true }
                    }
                    .navigationTitle("AppTemplate")
                    .toolbar {
                        NavigationLink {
                            Self.menuPane()
                        } label: { Label("Open menu", systemImage: "gear") }
                    }
                }
            } else {
                NavigationSplitView {
                    List {
                        Button("Show menu sheet") { self.showMenuSheet = true }
                        NavigationLink {
                            NavigationStack {
                                Form { Toggle("Toggle", isOn: .constant(false)) }
                                    .navigationTitle("Option")
                            }
                        } label: { Label("Option", systemImage: "gear") }
                        NavigationLink {
                            NavigationStack { Self.menuPane() }
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
        .sheet(isPresented: self.$showMenuSheet) {
            NavigationStack { Self.menuPane() }
        }
        .modifier(🪧Sheet())
        .modifier(💬RequestUserReview())
        .modifier(🩹Workaround.HideTitleBarOnMacCatalyst())
    }
}




extension ContentView {
    private static func menuPane() -> some View {
        List {
            Text(verbatim: "Placeholder")
                .redacted(reason: .placeholder)
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
        .modifier(NavigationTitleStyle())
        .navigationTitle("Menu")
        .toolbar { Image(systemName: "xmark") }
    }
}

struct NavigationTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS  17.0, *) {
            content
                .toolbarTitleDisplayMode(.large)
        } else {
            content
        }
    }
}
