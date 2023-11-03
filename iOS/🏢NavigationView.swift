import SwiftUI

struct 🏢NavigationView: View {
    @EnvironmentObject var model: 📱AppModel
    @EnvironmentObject var inAppPurchaseModel: 🛒InAppPurchaseModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        Group {
            if self.horizontalSizeClass == .compact {
                NavigationStack {
                    List {
                        Text(verbatim: "Placeholder")
                        Button("Show menu sheet") { self.model.presentedSheet = .menu }
                    }
                    .navigationTitle("AppTemplate")
                    .toolbar {
                        NavigationLink {
                            MenuPane()
                        } label: {
                            Label("Open menu", systemImage: "gear")
                        }
                    }
                }
            } else {
                NavigationSplitView {
                    List {
                        Button("Show menu sheet") {  self.model.presentedSheet = .menu }
                        NavigationLink {
                            NavigationStack {
                                Form { Toggle("Toggle", isOn: .constant(false)) }
                                    .navigationTitle("Option")
                            }
                        } label: { Label("Option", systemImage: "gear") }
                        NavigationLink {
                            NavigationStack { MenuPane() }
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
    }
}
