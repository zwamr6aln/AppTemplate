
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var 📱: 📱AppModel
    @EnvironmentObject var 🛒: 🛒StoreModel
    @State private var 🚩ShowPurchaseSheet: Bool = false
    var body: some View {
        NavigationView {
            List {
                📣ADBanner_pattern1($🚩ShowPurchaseSheet)
                
                🔗OpenSystemSetting()
                
                //📣ListRowADBanner()
                
                🛒PurchaseView()
                
                🩻TransparencyReportLink()
                
                Section {
                    HStack {
                        Text("displayName")
                        Spacer()
                        Text(🛒.🎫Name)
                            .foregroundStyle(.secondary)
                    }
                    
                    NavigationLink("🎫Product.debugDescription") {
                        Text(🛒.🎫Product.debugDescription)
                            .padding()
                            .minimumScaleFactor(0.1)
                            .navigationTitle("🎫Product.debugDescription")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                } header: { Text("In-App Purchase Product") }
                
                Section { 🖨printLog() }
                
                🔠BiggerSystemFontTest()
            }
            .listStyle(.plain)
            .navigationTitle("ContentView")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    🛠MenuButton()
                }
            }
            .modifier(🛒PurchaseSheet($🚩ShowPurchaseSheet))
        }
        //.overlay(alignment: .bottom) { 📣ADPopupBanner() }
        .animation(.default, value: 🛒.🚩ADIsActive)
    }
}




struct ContentView_Previews: PreviewProvider {
    static let 📱 = 📱AppModel()
    static let 🛒 = 🛒StoreModel(id: "PLACEHOLDER.adfree")
    
    static var previews: some View {
        ContentView()
            .environmentObject(📱)
            .environmentObject(🛒)
            .previewLayout(.fixed(width: 300, height: 600))
    }
}
