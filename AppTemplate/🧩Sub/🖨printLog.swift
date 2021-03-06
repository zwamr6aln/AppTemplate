
import SwiftUI

func printฬ(_ ๐ฆ: Any) {
    print(๐ฆ)
    
    var ๐จ = Date.now.formatted(date: .numeric, time: .standard) + " "
    print(๐ฆ, terminator: "", to: &๐จ)
    
    if let ๐พ = UserDefaults.standard.array(forKey: "print") as? [String] {
        var ๐: [String] = ๐พ
        ๐.append(๐จ)
        UserDefaults.standard.set(๐, forKey: "print")
    } else {
        UserDefaults.standard.set([๐จ], forKey: "print")
    }
}

struct ๐จprintLog: View {
    @State private var ๐: [String] = []
    
    var body: some View {
        NavigationLink {
            List {
                ForEach(๐.reversed(), id: \.self) { ๐ in
                    Text(๐)
                }
            }
            .navigationTitle("print-Log")
            .onAppear { ๐ปoad() }
            .refreshable { ๐ปoad() }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        UserDefaults.standard.removeObject(forKey: "print")
                        ๐ปoad()
                    } label: {
                        Label("delete", systemImage: "trash")
                    }
                    .tint(.red)
                }
            }
        } label: {
            Label("Check print-Log", systemImage: "printer")
        }
        .onAppear { printฬ("onAppered") }
    }
    
    func ๐ปoad() {
        if let ๐พ = UserDefaults.standard.stringArray(forKey: "print") {
            ๐ = ๐พ
        } else {
            ๐ = ["Empty"]
        }
    }
}
