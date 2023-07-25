import SwiftUI

struct 💬PrepareToRequestUserReview: ViewModifier {
    @Environment(\.requestReview) var requestReview
    @AppStorage("launchCount") private var launchCount: Int = 0
    @Binding var checkToRequest: Bool
    func body(content: Content) -> some View {
        content
            .task { self.launchCount += 1 }
            .onChange(of: self.checkToRequest) {
                if $0 == true {
                    if [10, 30, 50, 70, 90].contains(self.launchCount) {
                        self.requestReview()
                    }
                }
            }
    }
    init(_ checkToRequest: Binding<Bool>) {
        self._checkToRequest = checkToRequest
    }
}
