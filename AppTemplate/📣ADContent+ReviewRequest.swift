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
                if $0 == .inactive {
                    🛒.🚩showADSheet = false
                }
            }
            .onAppear {
                🛒.checkToShowADSheetOnLaunch()
            }
    }
}

struct 💬RequestUserReview: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .modifier(ⓜodifier())
        } else {
            content
        }
    }
    @available(iOS 16, *)
    private struct ⓜodifier: ViewModifier {
        @Environment(\.requestReview) var requestReview
        @AppStorage("launchCount") private var ⓛaunchCount: Int = 0
        func body(content: Content) -> some View {
            content
                .task { self.ⓛaunchCount += 1 }
                .onAppear {
                    if [10, 20, 30].contains(self.ⓛaunchCount) {
                        self.requestReview()
                    }
                }
        }
    }
}
