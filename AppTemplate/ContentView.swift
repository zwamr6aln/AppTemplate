
import SwiftUI


struct ContentView: View {
    @EnvironmentObject var 📱:📱Model
    
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
    }
}




struct ContentView_Previews: PreviewProvider {
    static let 📱 = 📱Model()
    
    static var previews: some View {
        ContentView()
            .environmentObject(📱)
            .previewLayout(.fixed(width: 300, height: 600))
    }
}
