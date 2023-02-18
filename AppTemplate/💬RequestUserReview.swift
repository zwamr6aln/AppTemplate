import SwiftUI

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
                        if [10, 20, 40, 100].contains(self.ⓛaunchCount) {
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
