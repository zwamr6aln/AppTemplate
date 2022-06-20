
import SwiftUI

class 📱AppModel: ObservableObject {
    
    @AppStorage("placeholder") var 🚩placeholder: Bool = false
    
    
    @Published var 🚩ShowMenu: Bool = false
    
    @Published var 🚩AdBanner: Bool = false
}
