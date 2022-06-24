
import SwiftUI

func print́(_ 📦: Any) {
    print(📦)
    
    var 🖨 = Date.now.formatted(date: .numeric, time: .standard) + " "
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
        NavigationLink {
            List {
                ForEach(🗒.reversed(), id: \.self) { 📃 in
                    Text(📃)
                }
            }
            .navigationTitle("printログ")
            .onAppear {
                🄻oad()
            }
            .refreshable {
                🄻oad()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        UserDefaults.standard.removeObject(forKey: "print")
                        🄻oad()
                    } label: {
                        Label("delete", systemImage: "trash")
                    }
                    .tint(.red)
                }
            }
        } label: {
            Label("printログを確認する", systemImage: "printer")
        }
        .onAppear {
            print́("onAppered")
        }
    }
    
    func 🄻oad() {
        if let 💾 = UserDefaults.standard.stringArray(forKey: "print") {
            🗒 = 💾
        } else {
            🗒 = ["empty"]
        }
    }
}
