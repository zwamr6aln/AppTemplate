
import SwiftUI

struct 📣ADSimpleBanner: View {
    @EnvironmentObject var 🛒: 🛒StoreModel
    
    var body: some View {
        ZStack {
            Color.clear
            if 🛒.🚩ADisActive {
                📣ADView(without: .Plain将棋盤)
                    .padding()
            }
        }
        .frame(height: 160)
        .animation(.default, value: 🛒.🚩Purchased)
    }
}
