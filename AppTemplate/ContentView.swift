
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var 📱: 📱AppModel
    @EnvironmentObject var 🛒: 🛒StoreModel
    
    var body: some View {
        NavigationView {
            List {
                🔗OpenSystemSetting()
                
                Section {
                    HStack {
                        Text("displayName")
                        Spacer()
                        Text(🛒.🎫Name)
                            .foregroundStyle(.secondary)
                    }
                    
                    NavigationLink("debugDescription") {
                        Text(🛒.🎫Product.debugDescription)
                            .padding()
                            .minimumScaleFactor(0.1)
                            .navigationTitle("debugDescription")
                    }
                } header: {
                    Text("Product")
                }
                
                
                Section {
                    🛠MenuButton()
                } header: {
                    Text("🛠MenuButton")
                }
                
                
                Section {
                    🖨printLog()
                } header: {
                    Text("printLog")
                }
            }
            .listStyle(.plain)
            .navigationTitle("AppTemplate")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    🛠MenuButton()
                }
            }
        }
        .overlay(alignment: .bottom) {
            📣ADBanner()
        }
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



struct ContentView_Previews: PreviewProvider {
    static let 📱 = 📱AppModel()
    
    static var previews: some View {
        ContentView()
            .environmentObject(📱)
            .previewLayout(.fixed(width: 300, height: 600))
    }
}
