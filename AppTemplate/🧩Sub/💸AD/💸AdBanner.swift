
import SwiftUI

struct 💸ADBanner: View {
    @EnvironmentObject var 🏬: 🏬StoreModel
    
    @State private var 🚩ShowBanner = false
    
    @AppStorage("🄻aunchCount") var 🄻aunchCount: Int = 0
    
    let 🅃iming: Int = 1 //TODO: Edit
    
    var body: some View {
        Group {
            if 🏬.🚩Purchased {
                EmptyView()
            } else {
                if 🚩ShowBanner {
                    💸ADView()
                        .padding(.horizontal)
                        .overlay(alignment: .topLeading) {
                            Button {
                                🚩ShowBanner = false
                            } label: {
                                Image(systemName: "xmark.circle")
                                    .padding(8)
                            }
                            .foregroundStyle(.tertiary)
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .foregroundStyle(.background)
                                .shadow(radius: 3)
                        }
                        .padding()
                        .transition(.move(edge: .bottom))
                        .frame(minWidth: 300)
                }
            }
        }
        .animation(.easeOut.speed(1.5), value: 🚩ShowBanner)
        .animation(.easeOut.speed(1.5), value: 🏬.🚩Purchased)
        .onAppear {
            🄻aunchCount += 1
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                if 🄻aunchCount % 🅃iming == 0 {
                    🚩ShowBanner = true
                }
            }
        }
    }
}
