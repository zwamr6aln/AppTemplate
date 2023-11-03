import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: 📱AppModel
    @EnvironmentObject var inAppPurchaseModel: 🛒InAppPurchaseModel
    var body: some View {
        🏢NavigationView()
            .modifier(🪧Sheet())
            .modifier(💬RequestUserReview())
            .modifier(🩹Workaround.HideTitleBarOnMacCatalyst())
    }
}
