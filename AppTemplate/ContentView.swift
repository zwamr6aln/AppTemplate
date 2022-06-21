
import SwiftUI


struct ContentView: View {
    @EnvironmentObject var 📱:📱AppModel
    
    var body: some View {
        VStack {
            Button {
                UISelectionFeedbackGenerator().selectionChanged()
                📱.🚩ShowMenu = true
            } label: {
                Image(systemName: "gear")
                    .font(.largeTitle)
                    .padding(24)
            }
            .accessibilityLabel("Open menu")
            .sheet(isPresented: $📱.🚩ShowMenu) {
                🛠MenuList()
                    .onDisappear {
                        📱.🚩ShowMenu = false
                    }
            }
        }
        .frame(width: 300, height: 500)
        .overlay(alignment: .bottom) {
            💸ADBanner()
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
