
import SwiftUI

class 📱AppModel: ObservableObject {
    
    @Published var 🚩ShowMenu: Bool = false
    
    @AppStorage("print") var 📃printLog: String = ""
    
    @AppStorage("placeholder") var 🚩placeholder: Bool = false
}




func print́(_ 📦: Any) {
    print(📦)
    
    var 📃 = ""
    📃 += UserDefaults.standard.string(forKey: "print") ?? ""
    print(📦, to: &📃)
    UserDefaults.standard.set(📃, forKey: "print")
}
