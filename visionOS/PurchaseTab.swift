import SwiftUI
import StoreKit

struct PurchaseTab: View {
    @Environment(\.purchase) var purchase
    var body: some View {
        Button("purchase") { //WIP
            Task {
                do {
                    if let ⓟroduct = try await Product.products(for: ["PLACEHOLDER.adfree"]).first {
                        let result = try await self.purchase(ⓟroduct)
                        switch result {
                            case .success(let verificationResult):
                                switch verificationResult {
                                    case .unverified(let signedType, let verificationError):
                                        print(signedType, verificationError)
                                    case .verified(let signedType):
                                        print(signedType)
                                        await signedType.finish()
                                }
                            case .userCancelled, .pending:
                                print(result)
                            @unknown default:
                                fatalError()
                        }
                    }
                } catch {
                    print(error)
                }
            }
        }
        .tabItem {
            Label("purchase", systemImage: "cart")
        }
    }
}
