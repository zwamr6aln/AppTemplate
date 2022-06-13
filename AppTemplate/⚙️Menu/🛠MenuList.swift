
import SwiftUI

struct 🛠MenuList: View {
    @EnvironmentObject var 📱:📱Model
    
    @Environment(\.dismiss) var 🔙: DismissAction
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Toggle("placeholder", isOn: .constant(false))
                        .redacted(reason: .placeholder)
                } header: {
                    Text("Option")
                }
                    
                📄DocumentMenu()
                
                💸AdSection()
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
