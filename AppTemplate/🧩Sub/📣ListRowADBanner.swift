
import SwiftUI

struct 📣ListRowADBanner: View {
    @EnvironmentObject var 🛒: 🛒StoreModel
    var body: some View {
        if 🛒.🚩ADIsActive {
            📣ADView(without: .Plain将棋盤)
                .padding(8)
        }
    }
}
