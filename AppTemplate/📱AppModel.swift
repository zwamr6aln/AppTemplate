
import SwiftUI

class 📱AppModel: ObservableObject {
    
    @Published var 🚩ShowMenu: Bool = false
    
    
    @AppStorage("placeholder") var 🚩placeholder: Bool = false
}




func print́(_ 📦: Any) {
    print(📦)
    
    var 🖨 = Date.now.formatted() + " "
    print(📦, terminator: "", to: &🖨)
    
    if let 💾 = UserDefaults.standard.array(forKey: "print") as? [String] {
        var 🗒: [String] = 💾
        🗒.append(🖨)
        UserDefaults.standard.set(🗒, forKey: "print")
    } else {
        UserDefaults.standard.set([🖨], forKey: "print")
    }
}
