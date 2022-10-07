
import SwiftUI

struct 🛒PurchaseSheet: ViewModifier {
    @Binding var 🚩ShowPurchaseSheet: Bool
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $🚩ShowPurchaseSheet) {
                NavigationView {
                    📣ADMenu()
                        .toolbar { ﹀DismissButton($🚩ShowPurchaseSheet) }
                }
                .navigationViewStyle(StackNavigationViewStyle())
            }
    }
    init(_ 🚩ShowPurchaseSheet: Binding<Bool>) {
        self._🚩ShowPurchaseSheet = 🚩ShowPurchaseSheet
    }
}

struct 📣ADBanner_pattern1: View { //TODO: WIP
    @EnvironmentObject var 🛒: 🛒StoreModel
    @Binding var 🚩ShowPurchaseSheet: Bool
    var body: some View {
        if 🛒.🚩ADIsActive {
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
                .buttonStyle(.borderless)
        } else {
            EmptyView()
        }
    }
    init(_ 🚩ShowPurchaseSheet: Binding<Bool>) {
        self._🚩ShowPurchaseSheet = 🚩ShowPurchaseSheet
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
