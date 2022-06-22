
import SwiftUI
import StoreKit

struct 🏬PurchaseSection: View {
    @EnvironmentObject var 🏬: 🏬StoreModel
    
    @State var 🚨ErrorTitle = ""
    @State var 🚨ShowError = false
    
    @State private var 🚩BuyingNow = false
    
    var body: some View {
        Group {
            Section {
                HStack {
                    Label(🏬.🎫Name, systemImage: 🏬.🚩Purchased ? "checkmark" : "questionmark")
                    
                    Spacer()
                    
                    Button(🏬.🎫Price) {
                        Task {
                            do {
                                🚩BuyingNow = true
                                try await 🏬.👆Purchase()
                            } catch 🚨StoreError.failedVerification {
                                🚨ErrorTitle = "Your purchase could not be verified by the App Store."
                                🚨ShowError = true
                            } catch {
                                print("Failed purchase for AD Free: \(error)")
                            }
                            
                            🚩BuyingNow = false
                        }
                    }
                    .disabled(🚩BuyingNow)
                    .buttonStyle(.borderedProminent)
                }
                .padding(.vertical, 8)
                .disabled(🏬.🚩Unconnected)
                .disabled(🏬.🚩Purchased)
                
                
                Image(systemName: "rectangle.dashed")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.tertiary)
                    .padding()
            } header: {
                Text("In-App Purchase")
            }
            
            
            🏬RestoreButton()
        }
        .alert(isPresented: $🚨ShowError) {
            Alert(title: Text(🚨ErrorTitle),
                  message: nil,
                  dismissButton: .default(Text("OK")))
        }
        .animation(.default, value: 🏬.🚩Purchased)
    }
}


struct 🏬RestoreButton: View {
    @EnvironmentObject var 🏬: 🏬StoreModel
    
    var body: some View {
        Section {
            Button {
                Task {
                    try? await AppStore.sync()
                }
            } label: {
                if 🏬.🚩Purchased {
                    Text("Restore purchase")
                        .strikethrough()
                        .foregroundStyle(.secondary)
                        .foregroundStyle(.secondary)
                } else {
                    Label("Restore purchase", systemImage: "arrow.clockwise")
                        .font(.subheadline)
                        .foregroundStyle(🏬.🚩Unconnected ? .secondary : .primary)
                }
            }
        }
    }
}
