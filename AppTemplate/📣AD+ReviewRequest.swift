import SwiftUI

struct 📣ADContent: ViewModifier {
    @EnvironmentObject var 🛒: 🛒StoreModel
    @State private var ⓐpp: 📣MyApp = .pickUpAppWithout(.FlipByBlink)
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $🛒.🚩showADSheet) {
                📣ADSheet(self.ⓐpp)
            }
            .onAppear {
                🛒.checkToShowADSheetOnLaunch()
            }
    }
}

@available(iOS 16, *)
struct 💬RequestUserReview: ViewModifier {
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
