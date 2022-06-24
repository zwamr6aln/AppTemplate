
import SwiftUI

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


struct 🖨printLog: View {
    @State private var 🗒: [String] = []
    
    var body: some View {
        NavigationLink("printログを確認する") {
            List {
                ForEach(🗒.reversed(), id: \.self) { 📃 in
                    Text(📃)
                }
            }
            .navigationTitle("printログ")
            .onAppear {
                syncLog()
            }
            .refreshable {
                syncLog()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        UserDefaults.standard.removeObject(forKey: "print")
                        syncLog()
                    } label: {
                        Label("delete", systemImage: "trash")
                    }
                    .tint(.red)
                }
            }
        }
    }
    
    func syncLog() {
        if let 💾 = UserDefaults.standard.stringArray(forKey: "print") {
            🗒 = 💾
        } else {
            🗒 = ["empty"]
        }
    }
}
