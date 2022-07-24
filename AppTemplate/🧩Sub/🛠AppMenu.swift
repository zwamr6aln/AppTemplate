
import SwiftUI

struct 🛠MenuButton: View {
    @EnvironmentObject var 📱: 📱AppModel
    
    var body: some View {
        Button {
            📱.🚩ShowMenu = true
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        } label: {
            Label("Open menu", systemImage: "gear")
        }
        .sheet(isPresented: $📱.🚩ShowMenu) {
            🛠AppMenu()
        }
    }
}

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
                
                🛠TemplateMenu()
            }
            .navigationTitle("AppTemplate")
            .toolbar { ﹀CloseMenuButton($📱.🚩ShowMenu) }
        }
        .onDisappear { 📱.🚩ShowMenu = false }
    }
}
