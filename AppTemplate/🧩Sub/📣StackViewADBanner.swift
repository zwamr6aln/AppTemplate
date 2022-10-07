
import SwiftUI

struct 📣StackViewADBanner: View {
    @EnvironmentObject var 🛒: 🛒StoreModel
    var body: some View {
        ZStack {
            Color.clear
            if 🛒.🚩ADIsActive {
                📣ADView(without: .Plain将棋盤)
                    .padding(8)
            }
        }
        .frame(maxHeight: 160)
        .animation(.default, value: 🛒.🚩Purchased)
    }
}
