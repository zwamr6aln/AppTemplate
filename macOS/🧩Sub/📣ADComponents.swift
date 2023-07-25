import SwiftUI

struct 📣ADView: View {
    @EnvironmentObject var 🛒: 🛒InAppPurchaseModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.openWindow) var openWindow
    @State private var disableDismiss: Bool = true
    private let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    @State private var countDown: Int
    private var targetApp: 📣ADTargetApp
    var body: some View {
        VStack {
            self.header()
            HStack(spacing: 16) {
                self.mockImage()
                VStack(spacing: 16) {
                    Spacer()
                    self.appIcon()
                    self.appName()
                    self.appDescription()
                    Spacer()
                    self.appStoreBadge()
                    Spacer()
                }
                .padding()
                .padding(.vertical)
            }
            .padding(32)
            .modifier(Self.PurchasedEffect())
        }
        .frame(minWidth: 700, maxWidth: 1000, minHeight: 500, maxHeight: 600)
        .onChange(of: 🛒.purchased) { if $0 { self.disableDismiss = false } }
        .onReceive(self.timer) { _ in
            if self.countDown > 1 {
                self.countDown -= 1
            } else {
                self.disableDismiss = false
            }
        }
    }
    private func header() -> some View {
        HStack {
            self.dismissButton()
            Text("\(self.countDown)")
                .foregroundStyle(.tertiary)
                .font(.subheadline)
                .opacity(self.disableDismiss ? 1 : 0)
            Spacer()
            self.adMenuLink()
        }
        .overlay {
            Text("AD", tableName: "AD&InAppPurchase")
                .font(.headline)
        }
        .padding(.top, 12)
        .padding(.horizontal, 18)
        .animation(.default, value: self.disableDismiss)
    }
    private func mockImage() -> some View {
        Link(destination: self.targetApp.url) {
            Image(self.targetApp.mockImageName)
                .resizable()
                .scaledToFit()
        }
        .accessibilityHidden(true)
        .disabled(🛒.purchased)
    }
    private func appIcon() -> some View {
        Link(destination: self.targetApp.url) {
            HStack(spacing: 16) {
                Image(self.targetApp.iconImageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                if self.targetApp.isHealthKitApp {
                    Image(.appleHealthBadge)
                }
            }
        }
        .accessibilityHidden(true)
        .disabled(🛒.purchased)
    }
    private func appName() -> some View {
        Link(destination: self.targetApp.url) {
            Text(self.targetApp.name, tableName: "AD&InAppPurchase")
                .font(.title.bold())
        }
        .buttonStyle(.plain)
        .accessibilityHidden(true)
        .disabled(🛒.purchased)
    }
    private func appDescription() -> some View {
        Text(self.targetApp.description, tableName: "AD&InAppPurchase")
            .font(.title3)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 8)
    }
    private func appStoreBadge() -> some View {
        Link(destination: self.targetApp.url) {
            HStack(spacing: 6) {
                Image(.appstoreBadge)
                Image(systemName: "hand.point.up.left")
            }
            .foregroundColor(.primary)
        }
        .accessibilityLabel(Text("Open AppStore page", tableName: "AD&InAppPurchase"))
        .disabled(🛒.purchased)
    }
    private func adMenuLink() -> some View {
        Button {
            self.openWindow(id: "InAppPurchase")
        } label: {
            Image(systemName: "questionmark")
        }
        .accessibilityLabel(Text("About AD", tableName: "AD&InAppPurchase"))
    }
    private func dismissButton() -> some View {
        Button {
            if !self.disableDismiss { self.dismiss() }
        } label: {
            Image(systemName: "xmark")
                .fontWeight(.medium)
        }
        .opacity(self.disableDismiss ? 0.33 : 1)
        .accessibilityLabel(Text("Dismiss", tableName: "AD&InAppPurchase"))
        .keyboardShortcut(.cancelAction)
    }
    private struct PurchasedEffect: ViewModifier {
        @EnvironmentObject var 🛒: 🛒InAppPurchaseModel
        func body(content: Content) -> some View {
            if 🛒.purchased {
                content
                    .blur(radius: 6)
                    .overlay {
                        Image(systemName: "trash.square.fill")
                            .resizable()
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, .red)
                            .frame(width: 160, height: 160)
                            .rotationEffect(.degrees(5))
                            .shadow(radius: 8)
                    }
            } else {
                content
            }
        }
    }
    init(_ app: 📣ADTargetApp, second: Int) {
        self.targetApp = app
        self._countDown = State(initialValue: second)
    }
}

struct 📣ADDescriptionSection: View {
    var body: some View {
        Section {
            GroupBox {
                Text("This App shows advertisement about applications on AppStore. These are several Apps by this app's developer. It is activated after you launch this app 5 times.",
                     tableName: "AD&InAppPurchase")
                .padding()
            }
        } header: {
            Text("About AD", tableName: "AD&InAppPurchase")
        }
    }
}

struct 📣ADMenuLink: View {
    @EnvironmentObject var 🛒: 🛒InAppPurchaseModel
    var body: some View {
        Section {
            🛒PurchaseView()
            NavigationLink {
                📣ADMenu()
            } label: {
                Label(String(localized: "About AD / Purchase", table: "AD&InAppPurchase"),
                      systemImage: "megaphone")
            }
        } header: {
            Text("AD / Purchase", tableName: "AD&InAppPurchase")
        }
    }
}

struct 📣ADMenu: View {
    @EnvironmentObject var 🛒: 🛒InAppPurchaseModel
    var body: some View {
        List {
            📣ADDescriptionSection()
            🛒IAPSection()
        }
        .navigationTitle(Text("In-App Purchase", tableName: "AD&InAppPurchase"))
    }
}
