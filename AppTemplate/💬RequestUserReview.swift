import SwiftUI

//リクエスト発生させるViewで以下を実装
//@State private var checkToRequestReview: Bool = false
//.modifier(💬RequestUserReview(self.$checkToRequestReview))
//self.checkToRequestReview = true
struct 💬RequestUserReviewOnLaunch: ViewModifier {//アプリ毎に個別に実装する
    @State private var checkToRequest: Bool = false
    func body(content: Content) -> some View {
        content
            .modifier(💬RequestUserReview(self.$checkToRequest))
            .onAppear { self.checkToRequest = true }
    }
}
