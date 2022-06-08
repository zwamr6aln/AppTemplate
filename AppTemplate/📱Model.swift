
import SwiftUI

class 📱Model: ObservableObject {
    
    @Published var 🚩ShowMenu: Bool = false
    
    @AppStorage("Unit") var 📏Unit: String = ""
}
