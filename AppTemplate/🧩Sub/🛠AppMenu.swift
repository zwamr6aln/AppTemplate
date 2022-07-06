
import SwiftUI

struct 🛠AppMenu: View {
    @EnvironmentObject var 📱: 📱AppModel
    @Binding var 🚩ShowMenu: Bool
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Toggle(isOn: .constant(false)) {
                        Label("placeholder", systemImage: "questionmark")
                    }
                } header: {
                    Text("Option")
                }
                
                
                📣ADMenuLink()
                📄InformationMenuLink()
            }
            .navigationTitle("AppName") //FIXME: App DisplayName
            .toolbar {
                ﹀CloseMenuButton($🚩ShowMenu)
            }
        }
    }
    
    init(_ 🚩: Binding<Bool>) {
        _🚩ShowMenu = 🚩
    }
}
