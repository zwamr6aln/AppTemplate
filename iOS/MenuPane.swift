import SwiftUI

struct MenuPane: View {
    @Environment(\.dismiss) var dismiss
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
        .toolbar {
            Button(role: .cancel) {
                self.dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .symbolRenderingMode(.hierarchical)
                    .tint(.secondary)
            }
        }
    }
}
