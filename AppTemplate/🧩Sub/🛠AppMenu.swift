
import SwiftUI

struct 🛠AppMenu: View {
    @EnvironmentObject var 📱: 📱AppModel
    
    var body: some View {
        Section {
            Toggle(isOn: .constant(false)) {
                Label("placeholder", systemImage: "questionmark")
            }
        } header: {
            Text("Option")
        }
    }
}
