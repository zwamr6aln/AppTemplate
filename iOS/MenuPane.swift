import SwiftUI

struct MenuPane: View {
    var body: some View {
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
        .navigationTitle("Menu")
        .toolbar { Image(systemName: "xmark") }
    }
}
