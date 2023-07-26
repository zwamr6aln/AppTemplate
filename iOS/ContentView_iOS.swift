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
                            NavigationStack { ℹ️AboutAppMenu(withSidebarLayout: true) }
                        } label: { Label("About", systemImage: "questionmark") }
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




extension ContentView {
    private static func menu() -> some View {
        List {
            Text("Placeholder")
            ℹ️AboutAppLink()
            🛒InAppPurchaseMenuLink()
        }
        .navigationTitle("Menu")
    }
}
