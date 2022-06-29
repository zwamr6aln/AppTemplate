
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var 📱: 📱AppModel
    @EnvironmentObject var 🛒: 🛒StoreModel
    
    var body: some View {
        NavigationView {
            List {
                🩻TransparencyReportLink()
                
                
                Section {
                    🛠MenuButton()
                } header: {
                    Text("🛠MenuButton")
                }
                
                
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
                    Text("🛒Product")
                }
                
                
                Section {
                    🖨printLog()
                } header: {
                    Text("🖨printLog")
                }
                
                
                Section {
                    🔗OpenSystemSetting()
                } header: {
                    Text("🔗OpenSystemSetting")
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




struct ContentView_Previews: PreviewProvider {
    static let 📱 = 📱AppModel()
    static let 🛒 = 🛒StoreModel()
    
    static var previews: some View {
        ContentView()
            .environmentObject(📱)
            .environmentObject(🛒)
            .previewLayout(.fixed(width: 300, height: 600))
    }
}
