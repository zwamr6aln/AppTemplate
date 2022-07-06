
import SwiftUI

struct 📣ADBanner: View {
    @EnvironmentObject var 🛒: 🛒StoreModel
    
    @State private var 🚩ShowBanner = false
    
    @AppStorage("🄻aunchCount") var 🄻aunchCount: Int = 0
    
    let 🅃iming: Int = 1 //FIXME: Change
    
    var body: some View {
        Group {
            if 🛒.🚩Purchased {
                EmptyView()
            } else {
                if 🚩ShowBanner {
                    📣ADView()
                        .padding(.horizontal)
                        .overlay(alignment: .topTrailing) {
                            Button {
                                🚩ShowBanner = false
                                UISelectionFeedbackGenerator().selectionChanged()
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .symbolRenderingMode(.multicolor)
                                    .font(.title)
                                    .offset(y: -27)
                                    .shadow(radius: 1.5)
                                    .padding()
                            }
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .foregroundStyle(.background)
                                .shadow(radius: 3)
                        }
                        .padding(12)
                        .transition(.move(edge: .bottom))
                        .frame(minWidth: 250)
                }
            }
        }
        .animation(.easeOut.speed(1.5), value: 🚩ShowBanner)
        .animation(.easeOut.speed(1.5), value: 🛒.🚩Purchased)
        .onAppear {
            🄻aunchCount += 1
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                if 🄻aunchCount % 🅃iming == 0 {
                    🚩ShowBanner = true
                }
            }
        }
    }
}
