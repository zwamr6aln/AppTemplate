
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
                
                
                🖨printLog()
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
    @State private var printLog: [String] = []
    
    var body: some View {
        NavigationLink("print log") {
            List {
                ForEach(printLog.reversed(), id: \.self) { a in
                    Text(a)
                }
            }
            .navigationTitle("print log")
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
        if let LOG = UserDefaults.standard.stringArray(forKey: "print") {
            printLog = LOG
        } else {
            printLog = ["empty"]
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
