import SwiftUI

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
