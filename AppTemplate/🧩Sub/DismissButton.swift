import SwiftUI

struct DismissButton: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            self.dismiss()
            UISelectionFeedbackGenerator().selectionChanged()
        } label: {
            Image(systemName: "chevron.down")
        }
        .tint(.secondary)
        .accessibilityLabel("Dismiss")
    }
}
