
import SwiftUI


struct ContentView: View {
    @EnvironmentObject var 📱:📱AppModel
    @EnvironmentObject var 🏬: 🏬StoreModel
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Text("displayName")
                        Spacer()
                        Text(🏬.🎫Name)
                            .foregroundStyle(.secondary)
                    }
                    
                    NavigationLink("debugDescription") {
                        Text(🏬.🎫Product.debugDescription)
                            .padding()
                            .minimumScaleFactor(0.1)
                            .navigationTitle("debugDescription")
                    }
                } header: {
                    Text("Product")
                }
            }
            .listStyle(.plain)
            .navigationTitle("AppTemplate")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        UISelectionFeedbackGenerator().selectionChanged()
                        📱.🚩ShowMenu = true
                    } label: {
                        Image(systemName: "gear")
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
        .overlay(alignment: .bottom) {
            💸ADBanner()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static let 📱 = 📱AppModel()
    
    static var previews: some View {
        ContentView()
            .environmentObject(📱)
            .previewLayout(.fixed(width: 300, height: 600))
    }
}
