import SwiftUI

@main
struct App_macOS: App {
    @StateObject private var 📱 = 📱AppModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
        }
    }
}

class 📱AppModel: ObservableObject {
    @Published var showSheet: Bool = false
}
