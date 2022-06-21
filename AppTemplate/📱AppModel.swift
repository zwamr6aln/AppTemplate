
import SwiftUI

class 📱AppModel: ObservableObject {
    
    @Published var 🚩ShowMenu: Bool = false
    
    
    @AppStorage("placeholder") var 🚩placeholder: Bool = false
}
