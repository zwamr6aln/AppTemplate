
import SwiftUI

struct 🛠MenuSheet: View {
    @Environment(\.dismiss) var 🔙: DismissAction
    
    var body: some View {
        NavigationView {
            List {
                🛠AppMenu()
                
                📣ADMenu()
                
                📄InformationMenu()
            }
            .navigationTitle("AppName") //FIXME: App DisplayName
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
