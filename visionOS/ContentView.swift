import SwiftUI
import StoreKit

struct ContentView: View {
    @EnvironmentObject var model: 📱AppModel
    @Environment(\.purchase) var purchase
    @State private var presentAboutApp: Bool = false
    var body: some View {
        TabView {
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
            ℹ️AboutAppTab()
                .tabItem {
                    Label(String(localized: "About App", table: "🌐AboutApp"),
                          systemImage: "info")
                }
            NavigationSplitView {
                List {
                    NavigationLink {
                        NavigationStack {
                            Form {
                                Toggle("Toggle", isOn: .constant(false))
                            }
                            .navigationTitle("Option")
                        }
                    } label: {
                        Label("Option", systemImage: "gear")
                    }
                    NavigationLink {
                        NavigationStack {
                            List {
                                Text(verbatim: "Placeholder")
                            }
                            .navigationTitle("Menu")
                        }
                    } label: {
                        Label("Menu", systemImage: "gearshape")
                    }
                    Button {
                        self.presentAboutApp.toggle()
                    } label: {
                        Label(String(localized: "About App", table: "🌐AboutApp"),
                              systemImage: "info")
                    }
                }
                .navigationTitle("AppTemplate")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            self.presentAboutApp.toggle()
                        } label: {
                            Label(String(localized: "About App", table: "🌐AboutApp"),
                                  systemImage: "info")
                        }
                    }
                }
            } detail: {
                Text(verbatim: "Detail")
                    .help("Help Content")
                    .padding()
                    .background(in: .rect(cornerRadius: 12, style: .continuous))
            }
            .frame(minWidth: 800)
            .sheet(isPresented: self.$presentAboutApp) { ℹ️AboutAppMenu() }
            .tabItem { Label("Home", systemImage: "house") }
        }
    }
}
