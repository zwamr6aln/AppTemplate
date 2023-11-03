import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: 📱AppModel
    var body: some View {
        🏢NavigationView()
            .modifier(🪧Sheet())
            .modifier(💬RequestUserReview())
            .modifier(🩹Workaround.HideTitleBarOnMacCatalyst())
            .environmentObject(self.model.inAppPurchaseModel)
    }
}
