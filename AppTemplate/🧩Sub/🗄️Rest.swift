import SwiftUI

struct 🗄️NavigationStack<Content: View>: View {
    @ViewBuilder var content: () -> Content
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack { self.content() }
        } else {
            NavigationView { self.content() }
                .navigationViewStyle(.stack)
        }
    }
}
