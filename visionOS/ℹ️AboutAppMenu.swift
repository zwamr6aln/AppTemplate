import SwiftUI

struct ℹ️AboutAppMenu: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            List {
                ℹ️AboutAppContent()
            }
            .navigationTitle(String(localized: "About App", table: "🌐AboutApp"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        self.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .buttonBorderShape(.circle)
                    .keyboardShortcut(.escape)
                }
            }
        }
    }
}
