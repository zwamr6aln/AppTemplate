import SwiftUI
import StoreKit

struct ContentView: View {
    @EnvironmentObject var ⓓelegate: 🄰pplicationDelegate
    @EnvironmentObject var 📱: 📱AppModel
    @EnvironmentObject var 🛒: 🛒StoreModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @AppStorage("sharedText") var ⓢharedText: String = "empty"
    var body: some View {
        if #available(iOS 16.0, *) {
            Group {
                if self.horizontalSizeClass == .compact {
                    NavigationStack { self.ⓒontent() }
                } else {
                    NavigationSplitView(columnVisibility: .constant(.all)) {
                        self.ⓒontent()
                    } detail: {
                        Image(systemName: "questionmark")
                            .font(.largeTitle)
                            .foregroundStyle(.tertiary)
                    }
                }
            }
            .modifier(🅁equestUserReview())
        } else {
            NavigationView { self.ⓒontent() }
                .navigationViewStyle(.stack)
        }
    }
    private func ⓒontent() -> some View {
        List {
            Button("支払い済みでなければ広告シートを表示する") {
                🛒.checkToShowADSheetOnLaunch()
            }
            
            Text("sharedText:" + ⓢharedText)
            
            🔗OpenSystemSetting()
            
            🛒PurchaseView()
            
            Section {
                HStack {
                    Text("displayName")
                    Spacer()
                    Text(🛒.🎫name)
                        .foregroundStyle(.secondary)
                }
                
                NavigationLink("🎫Product.debugDescription") {
                    Text(🛒.🎫product.debugDescription)
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
                        self.requestReview.callAsFunction()
                    } label: {
                        Image(systemName: "star.bubble")
                    }
                }
            }
    }
}

struct ﹀DismissButton: View {
    @Binding var 🚩showSheet: Bool
    var body: some View {
        Button {
            🚩showSheet = false
            UISelectionFeedbackGenerator().selectionChanged()
        } label: {
            Image(systemName: "chevron.down")
        }
        .tint(.secondary)
        .accessibilityLabel("Dismiss")
    }
    init(_ 🚩showSheet: Binding<Bool>) {
        self._🚩showSheet = 🚩showSheet
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static let 📱 = 📱AppModel()
//    static let 🛒 = 🛒StoreModel(id: "PLACEHOLDER.adfree")
//
//    static var previews: some View {
//        ContentView()
//            .environmentObject(📱)
//            .environmentObject(🛒)
//            .previewLayout(.fixed(width: 300, height: 600))
//    }
//}
