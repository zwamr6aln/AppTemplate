
import SwiftUI
import StoreKit

struct 🏬PurchaseSection: View {
    @EnvironmentObject var 🏬: 🏬StoreModel
    
    @State private var 🚩BuyingNow = false
    
    @State var 🚨ShowError = false
    @State var 🚨ErrorTitle = ""
    
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
                    .overlay {
                        if 🚩BuyingNow {
                            ProgressView()
                        }
                    }
                }
                .padding(.vertical)
                .disabled(🏬.🚩Unconnected)
                .disabled(🏬.🚩Purchased)
                
                
                🏬ProductPreview()
            } header: {
                Text("In-App Purchase")
            } footer: {
                if 🏬.🚩Purchased {
                    Text("Purchased")
                }
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


struct 🏬ProductPreview: View {
    @EnvironmentObject var 🏬: 🏬StoreModel
    
    var body: some View {
        HStack {
            Image("ProductPreview_Before")
                .resizable()
                .scaledToFit()
                .shadow(radius: 2)
            
            Image(systemName: "arrow.right")
                .font(.title2.weight(.semibold))
                .foregroundStyle(.tertiary)
            
            Image("ProductPreview_After")
                .resizable()
                .scaledToFit()
                .shadow(radius: 2)
        }
        .padding(.horizontal)
        .padding(24)
    }
}


struct 🏬RestoreButton: View {
    @EnvironmentObject var 🏬: 🏬StoreModel
    
    @State private var 🚩RestoringNow = false
    
    @State var 🚨ShowError = false
    @State var 🚨ErrorTitle = ""
    
    var body: some View {
        Section {
            Button {
                Task {
                    do {
                        🚩RestoringNow = true
                        try await AppStore.sync()
                        🚩RestoringNow = false
                    } catch {
                        🚨ShowError = true
                        🚨ErrorTitle = error.localizedDescription
                        🚩RestoringNow = false
                    }
                }
            } label: {
                HStack {
                    Label("Restore purchase", systemImage: "arrow.clockwise")
                        .font(.footnote)
                        .foregroundColor(🏬.🚩Unconnected || 🏬.🚩Purchased ? .secondary : nil)
                    
                    if 🚩RestoringNow {
                        Spacer()
                        
                        ProgressView()
                    }
                }
            }
            .disabled(🚩RestoringNow)
        }
        .alert(isPresented: $🚨ShowError) {
            Alert(title: Text(🚨ErrorTitle),
                  message: nil,
                  dismissButton: .default(Text("OK")))
        }
    }
}
