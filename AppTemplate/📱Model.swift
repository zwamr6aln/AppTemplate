
import SwiftUI

class 📱Model: ObservableObject {
    
    @Published var 🚩ShowMenu: Bool = false
    
    @Published var 🚩AdBanner: Bool = false
    
    @AppStorage("Unit") var 📏Unit: String = ""
}
