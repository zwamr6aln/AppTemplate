import SwiftUI

struct 📣ADContent: ViewModifier {
    @EnvironmentObject var 🛒: 🛒StoreModel
    @State private var ⓐpp: 📣MyApp
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $🛒.🚩showADSheet) {
                📣ADSheet(ⓐpp)
            }
            .onAppear { 🛒.🚩showADSheet = true }
    }
    init() {
        let ⓐpps = 📣MyApp.allCases.filter { $0 != .FlipByBlink }
        self.ⓐpp = ⓐpps.randomElement()!
    }
}
