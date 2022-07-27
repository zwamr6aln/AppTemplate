
import SwiftUI

struct 🛠AppMenu: View {
    @EnvironmentObject var 📱: 📱AppModel
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Toggle(isOn: .constant(false)) {
                        Label("placeholder", systemImage: "questionmark")
                    }
                } header: { Text("Option") }
                
                🛠OthersMenu()
            }
            .navigationTitle("Menu")
            .toolbar { ﹀CloseMenuButton($📱.🚩ShowMenu) }
        }
        .onDisappear { 📱.🚩ShowMenu = false }
    }
}
