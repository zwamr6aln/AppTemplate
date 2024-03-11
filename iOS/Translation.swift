import SwiftUI
import Translation

struct TranslationButton: View {
    var text: String = "This is placeholder."
    @State private var isPresented: Bool = false
    var body: some View {
        if #available(iOS 17.4, *) {
            Button("translate") {
                self.isPresented = true
            }
            .translationPresentation(isPresented: self.$isPresented,
                                     text: self.text)
        } else {
            EmptyView()
        }
    }
}
