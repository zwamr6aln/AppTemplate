
import SwiftUI

struct 🛒PurchaseSheet: View { //TODO: WIP
    @EnvironmentObject var 🛒: 🛒StoreModel
    @Environment(\.dismiss) var ⓓismissAction: DismissAction
    var body: some View {
        NavigationView {
            📣ADMenu()
                .toolbar { ﹀DismissButton(ⓓismissAction) }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct 📣test_ADView: View { //TODO: WIP
    @Binding var 🚩ShowPurchaseSheet: Bool
    var body: some View {
        📣ADView()
            .overlay(alignment: .topTrailing) {
                Button {
                    🚩ShowPurchaseSheet = true
                    UISelectionFeedbackGenerator().selectionChanged()
                } label: {
                    Image(systemName: "questionmark.circle")
                        .foregroundStyle(.secondary)
                        .font(.body.weight(.medium))
                        .padding(.vertical)
                        .padding(.leading)
                }
                .foregroundColor(.red)
                .accessibilityLabel("Purchase")
            }
    }
    
    struct purchaseSheet: View {
        @EnvironmentObject var 🛒: 🛒StoreModel
        @Environment(\.dismiss) var ⓓismissAction: DismissAction
        var body: some View {
            NavigationView {
                📣ADMenu()
                    .toolbar { ﹀DismissButton(ⓓismissAction) }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
