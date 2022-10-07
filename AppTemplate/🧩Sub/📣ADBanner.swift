
import SwiftUI

struct 📣ADBanner_pattern1: View {
    @EnvironmentObject var 🛒: 🛒StoreModel
    @Binding var 🚩ShowPurchaseSheet: Bool
    var body: some View {
        if 🛒.🚩ADIsActive {
            HStack {
                📣ADView()
                Button {
                    🚩ShowPurchaseSheet = true
                    UISelectionFeedbackGenerator().selectionChanged()
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .padding(.vertical)
                        .padding(.leading, 8)
                }
                .foregroundStyle(.secondary)
                .accessibilityLabel("Purchase")
            }
            .buttonStyle(.borderless)
        } else {
            EmptyView()
        }
    }
    init(_ 🚩ShowPurchaseSheet: Binding<Bool>) {
        self._🚩ShowPurchaseSheet = 🚩ShowPurchaseSheet
    }
}
