
import SwiftUI

struct 🛠MenuList: View {
    @EnvironmentObject var 📱: 📱AppModel
    
    @Environment(\.dismiss) var 🔙: DismissAction
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Toggle("    placeholder    ", isOn: 📱.$🚩placeholder)
                        .redacted(reason: .placeholder)
                } header: {
                    Text("Option")
                }
                    
                📄DocumentMenu()
                
                💸ADSection()
            }
            .navigationTitle("AppName")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        🔙.callAsFunction()
                    } label: {
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.secondary)
                            .grayscale(1.0)
                            .padding(8)
                    }
                    .accessibilityLabel("Dismiss")
                }
            }
        }
    }
}
