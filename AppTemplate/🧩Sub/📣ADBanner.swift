
import SwiftUI

struct 📣ADBanner: View {
    @Binding var 🚩ShowPurchaseSheet: Bool
    var body: some View {
        📣ADView(without: .Plain将棋盤, $🚩ShowPurchaseSheet)
    }
    init(_ 🚩ShowPurchaseSheet: Binding<Bool>) {
        self._🚩ShowPurchaseSheet = 🚩ShowPurchaseSheet
    }
}


//struct 📣ADPopupBanner: View {
//    @EnvironmentObject var 🛒: 🛒StoreModel
//    @State private var 🚩ShowBanner = true
//
//    var body: some View {
//        Group {
//            if 🛒.🚩ADIsActive {
//                if 🚩ShowBanner {
//                    📣ADView()
//                        .padding(.horizontal)
//                        .overlay(alignment: .topTrailing) {
//                            Button {
//                                🚩ShowBanner = false
//                                UINotificationFeedbackGenerator().notificationOccurred(.warning)
//                            } label: {
//                                Image(systemName: "xmark.circle.fill")
//                                    .symbolRenderingMode(.multicolor)
//                                    .font(.title)
//                                    .shadow(radius: 1.5)
//                                    .padding(12)
//                            }
//                            .alignmentGuide(.top) { $0.height * 2 / 5 }
//                        }
//                        .background {
//                            RoundedRectangle(cornerRadius: 16, style: .continuous)
//                                .foregroundStyle(.background)
//                                .shadow(color: .secondary, radius: 3, y: 0.5)
//                        }
//                        .padding(14)
//                        .transition(.move(edge: .bottom))
//                        .frame(minWidth: 300, maxHeight: 250, alignment: .bottom)
//                }
//            }
//        }
//        .animation(.easeOut.speed(0.5), value: 🚩ShowBanner)
//        .animation(.easeOut.speed(0.5), value: 🛒.🚩Purchased)
//    }
//}
