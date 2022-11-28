import SwiftUI
import StoreKit

struct ContentView: View {
    @EnvironmentObject var ⓓelegate: 🄰pplicationDelegate
    @EnvironmentObject var 📱: 📱AppModel
    @EnvironmentObject var 🛒: 🛒StoreModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var 🚩ShowADMenuSheet: Bool = false
    @AppStorage("sharedText") var ⓢharedText: String = "empty"
    var body: some View {
        if #available(iOS 16.0, *) {
            Group {
                if horizontalSizeClass == .compact {
                    NavigationStack { 🄻istView() }
                } else {
                    NavigationSplitView(columnVisibility: .constant(.all)) {
                        🄻istView()
                    } detail: {
                        Image(systemName: "questionmark")
                            .font(.largeTitle)
                            .foregroundStyle(.tertiary)
                    }
                }
            }
            .modifier(🅁equestUserReview())
        } else {
            NavigationView { 🄻istView() }
                .navigationViewStyle(.stack)
        }
        //.overlay(alignment: .bottom) { 📣ADPopupBanner() }
    }
    func 🄻istView() -> some View {
        List {
            Text("sharedText:" + ⓢharedText)
            
            📣ADBanner($🚩ShowADMenuSheet)
            
            🔗OpenSystemSetting()
            
            🛒PurchaseView()
            
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
}


@available(iOS 16, *)
struct 🅁equestUserReview: ViewModifier {
    @Environment(\.requestReview) var requestReview
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        requestReview.callAsFunction()
                    } label: {
                        Image(systemName: "star.bubble")
                    }
                }
            }
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
