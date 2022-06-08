
import SwiftUI


struct ContentView: View {
    @EnvironmentObject var 📱:📱Model
    
    var body: some View {
        Text("Hello, world!")
            .padding()
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
