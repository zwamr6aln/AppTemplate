import SwiftUI

struct 📣ADContent: ViewModifier {
    @EnvironmentObject var 🛒: 🛒StoreModel
    @Environment(\.scenePhase) var scenePhase: ScenePhase
    @State private var ⓐpp: 📣MyApp = .pickUpAppWithout(.FlipByBlink)
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $🛒.🚩showADSheet) {
                📣ADSheet(self.ⓐpp)
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
