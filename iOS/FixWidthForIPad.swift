import SwiftUI

struct FixWidthForIPad: ViewModifier {
    func body(content: Content) -> some View {
        GeometryReader { ⓟroxy in
            content
                .safeAreaInset(edge: .leading) {
                    Spacer()
                        .frame(width: ⓟroxy.size.width > 1100 ? 200 : 0)
                }
                .safeAreaInset(edge: .trailing) {
                    Spacer()
                        .frame(width: ⓟroxy.size.width > 1100 ? 200 : 0)
                }
                //.safeAreaPadding(.horizontal, ⓟroxy.size.width > 1100 ? 200 : 0)
        }
    }
}
