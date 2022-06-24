
import SwiftUI
import StoreKit

struct 🏬PurchaseSection: View {
    @EnvironmentObject var 🏬: 🏬StoreModel
    
    @State private var 🚩BuyingNow = false
    
    @State var 🚨ShowError = false
    @State var 🚨ErrorMessage = ""
    
    var body: some View {
        Group {
            Section {
                HStack {
                    Label(🏬.🎫Name, systemImage: "cart")
                    
                    Spacer()
                    
                    Button(🏬.🎫Price) {
                        Task {
                            do {
                                🚩BuyingNow = true
                                try await 🏬.👆Purchase()
                            } catch 🚨StoreError.failedVerification {
                                🚨ErrorMessage = "Your purchase could not be verified by the App Store."
                                🚨ShowError = true
                            } catch {
                                print("Failed purchase: \(error)")
                                🚨ErrorMessage = error.localizedDescription
                                🚨ShowError = true
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
                        
                        if 🏬.🚩Purchased {
                            Image(systemName: "checkmark")
                        }
                    }
                    .alert(isPresented: $🚨ShowError) {
                        Alert(title: Text("Error"),
                              message: Text(🚨ErrorMessage),
                              dismissButton: .default(Text("OK")))
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
    
    @State var 🚨ShowAlert = false
    @State var 🚨SyncSuccess = false
    @State var 🚨Message = ""
    
    var body: some View {
        Section {
            Button {
                Task {
                    do {
                        🚩RestoringNow = true
                        try await AppStore.sync()
                        🚨SyncSuccess = true
                        🚨Message = "Restored transactions"
                    } catch {
                        print("Failed sync: \(error)")
                        🚨SyncSuccess = false
                        🚨Message = error.localizedDescription
                    }
                    
                    🚨ShowAlert = true
                    🚩RestoringNow = false
                }
            } label: {
                HStack {
                    Label("Restore Purchases", systemImage: "arrow.clockwise")
                        .font(.footnote)
                        .foregroundColor(🏬.🚩Unconnected || 🏬.🚩Purchased ? .secondary : nil)
                    
                    if 🚩RestoringNow {
                        Spacer()
                        
                        ProgressView()
                    }
                }
            }
            .disabled(🚩RestoringNow)
            .alert(isPresented: $🚨ShowAlert) {
                Alert(title: Text(🚨SyncSuccess ? "Done" : "Error"),
                      message: Text(LocalizedStringKey(🚨Message)),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}
