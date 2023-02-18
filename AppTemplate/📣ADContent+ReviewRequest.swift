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
                🛒.checkToShowADSheet()
            }
    }
}

//リクエスト発生させるViewで以下を実装
//@State private var checkToRequestReview: Bool = false
//.modifier(💬RequestUserReview(self.$checkToRequestReview))
//self.checkToRequestReview = true
struct 💬RequestUserReview: ViewModifier {
    @Binding private var checkToRequest: Bool
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .modifier(ⓜodifier(self.$checkToRequest))
        } else {
            content
        }
    }
    init(_ checkToRequest: Binding<Bool>) {
        self._checkToRequest = checkToRequest
    }
    @available(iOS 16, *)
    private struct ⓜodifier: ViewModifier {
        @Environment(\.requestReview) var requestReview
        @AppStorage("launchCount") private var ⓛaunchCount: Int = 0
        @Binding private var checkToRequest: Bool
        func body(content: Content) -> some View {
            content
                .task { self.ⓛaunchCount += 1 }
                .onChange(of: self.checkToRequest) {
                    if $0 == true {
                        if [5, 10, 15, 20, 30].contains(self.ⓛaunchCount) {//FIXME: 回数を再検討
                            self.requestReview()
                        }
                    }
                }
        }
        init(_ checkToRequest: Binding<Bool>) {
            self._checkToRequest = checkToRequest
        }
    }
}
