
import SwiftUI

struct 🛠MenuButton: View {
    @State private var 🚩ShowMenu = false
    
    var body: some View {
        Button {
            🚩ShowMenu = true
            UISelectionFeedbackGenerator().selectionChanged()
        } label: {
            Label("Open menu", systemImage: "gear")
        }
        .sheet(isPresented: $🚩ShowMenu) {
            🛠AppMenu($🚩ShowMenu)
                .onDisappear { 🚩ShowMenu = false }
        }
    }
}


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
                } header: { Text("Option") }
                
                📣ADMenuLink()
                📄InformationMenuLink()
            }
            .navigationTitle("AppName") //FIXME: App DisplayName
            .toolbar { ﹀CloseMenuButton($🚩ShowMenu) }
        }
    }
    
    init(_ 🚩: Binding<Bool>) { _🚩ShowMenu = 🚩 }
}
