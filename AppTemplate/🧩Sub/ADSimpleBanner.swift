
import SwiftUI

struct 📣ADSimpleBanner: View {
    @EnvironmentObject var 🛒: 🛒StoreModel
    
    var body: some View {
        ZStack {
            Color.clear
            if 🛒.🚩ADisActive {
                📣ADView()
                    .padding()
            }
        }
        .frame(height: 160)
        .animation(.default, value: 🛒.🚩Purchased)
    }
}
