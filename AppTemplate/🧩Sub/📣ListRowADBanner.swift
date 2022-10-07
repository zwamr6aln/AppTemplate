
import SwiftUI

struct 📣ListRowADBanner: View {
    @EnvironmentObject var 🛒: 🛒StoreModel
    
    var body: some View {
        if 🛒.🚩ADIsActive {
            📣ADView(without: .Plain将棋盤)
                .padding(8)
        }
//        ZStack { //保留
//            Color.blue
//            if 🛒.🚩ADIsActive {
//                📣ADView(without: .Plain将棋盤)
//                    .padding(8)
//            }
//        }
//        .frame(maxHeight: 160)
//        .animation(.default, value: 🛒.🚩Purchased)
    }
}
