import SwiftUI

struct 🄳ismissButton: View {
    @Environment(\.dismiss) private var dismiss
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
