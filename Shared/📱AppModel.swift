import SwiftUI

class 📱AppModel: ObservableObject {
#if os(iOS)
    @Published var showSheet: 🪧Sheet.Source? = nil
#endif
}
