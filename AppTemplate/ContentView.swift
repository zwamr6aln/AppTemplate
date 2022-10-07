
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var 📱: 📱AppModel
    @EnvironmentObject var 🛒: 🛒StoreModel
    @State private var 🚩ShowADMenuSheet: Bool = false
    var body: some View {
        NavigationView {
            List {
                📣ADBanner_pattern1($🚩ShowADMenuSheet)
                
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
            .modifier(📣ADMenuSheet($🚩ShowADMenuSheet))
        }
        //.overlay(alignment: .bottom) { 📣ADPopupBanner() }
    }
}


struct ﹀DismissButton: View {
    var ﹀Dismiss: DismissAction? = nil
    @Binding var 🚩ShowSheet: Bool
    var body: some View {
        Button {
            if let ﹀Dismiss {
                ﹀Dismiss.callAsFunction()
            } else {
                🚩ShowSheet = false
            }
            UISelectionFeedbackGenerator().selectionChanged()
        } label: {
            Image(systemName: "chevron.down")
        }
        .tint(.secondary)
        .accessibilityLabel("Dismiss")
    }
    init(_ ﹀Dismiss: DismissAction) {
        self.﹀Dismiss = ﹀Dismiss
        self._🚩ShowSheet = .constant(false)
    }
    init(_ 🚩ShowSheet: Binding<Bool>) {
        self._🚩ShowSheet = 🚩ShowSheet
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
