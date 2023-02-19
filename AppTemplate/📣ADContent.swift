import SwiftUI

struct 📣ADContent: ViewModifier {
    @EnvironmentObject var 🛒: 🛒StoreModel
    @Environment(\.scenePhase) var scenePhase
    @State private var ⓐpp: 📣MyApp = .pickUpAppWithout(.FlipByBlink)
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $🛒.🚩showADSheet) {
                if #available(iOS 16.0, *) {
                    📣ADSheet(self.ⓐpp)
                        .presentationDetents([.height(560)])
                } else {
                    📣ADSheet(self.ⓐpp)
                }
            }
            .onChange(of: self.scenePhase) {
                if $0 == .background {
                    🛒.🚩showADSheet = false
                }
            }
            .onAppear {
                🛒.checkToShowADSheet()//アプリ毎にこの関数を呼ぶ場所を検討する
            }
    }
}
