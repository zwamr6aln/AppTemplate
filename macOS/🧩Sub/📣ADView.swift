import SwiftUI

struct 📣ADView: View {
    @EnvironmentObject var 🛒: 🛒InAppPurchaseModel
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.dismiss) var dismiss
    @State private var disableDismiss: Bool = true
    private let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    @State private var countDown: Int
    private var targetApp: 📣ADTargetApp
    @State private var showADMenu: Bool = false
    var body: some View {
        NavigationStack { self.appADContent() }
            .presentationDetents([.height(640)])
            .onChange(of: self.scenePhase) {
                if $0 == .background { self.dismiss() }
            }
            .onChange(of: 🛒.purchased) { if $0 { self.disableDismiss = false } }
            .interactiveDismissDisabled(self.disableDismiss)
            .onReceive(self.timer) { _ in
                if self.countDown > 1 {
                    self.countDown -= 1
                } else {
                    self.disableDismiss = false
                }
            }
            .overlay(alignment: .topLeading) {
                HStack {
                    if !self.showADMenu {
                        self.dismissButton()
                        Spacer()
                        self.adMenuLink()
                    }
                }
                .font(.title3)
                .padding(.top, 12)
                .padding(.horizontal, 18)
                .animation(.default, value: self.disableDismiss)
                .animation(.default, value: self.showADMenu)
            }
    }
    private func appADContent() -> some View {
        Group {
            if self.verticalSizeClass == .compact {
                self.horizontalLayout()
            } else {
                self.verticalLayout()
            }
        }
        .modifier(Self.PurchasedEffect())
        .navigationTitle(Text("AD", tableName: "AD&InAppPurchase"))
        .navigationDestination(isPresented: self.$showADMenu) { 📣ADMenu() }
    }
    private func verticalLayout() -> some View {
        VStack(spacing: 16) {
            Spacer(minLength: 0)
            self.mockImage()
            Spacer(minLength: 0)
            self.appIcon()
            self.appName()
            Spacer(minLength: 0)
            self.appDescription()
            Spacer(minLength: 0)
            self.appStoreBadge()
            Spacer(minLength: 0)
        }
        .padding()
    }
    private func horizontalLayout() -> some View {
        HStack(spacing: 16) {
            self.mockImage()
            VStack(spacing: 12) {
                Spacer()
                self.appIcon()
                self.appName()
                self.appDescription()
                Spacer()
                self.appStoreBadge()
                Spacer()
            }
            .padding(.horizontal)
        }
        .padding()
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
                    .frame(width: 60, height: 60)
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
                .font(.headline)
        }
        .buttonStyle(.plain)
        .accessibilityHidden(true)
        .disabled(🛒.purchased)
    }
    private func appDescription() -> some View {
        Text(self.targetApp.description, tableName: "AD&InAppPurchase")
            .font(.subheadline)
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
            self.showADMenu = true
        } label: {
            Image(systemName: "questionmark.circle")
        }
        .tint(.primary)
        .accessibilityLabel(Text("About AD", tableName: "AD&InAppPurchase"))
    }
    private func dismissButton() -> some View {
        Group {
            if self.disableDismiss {
                Image(systemName: "\(self.countDown).circle")
                    .foregroundStyle(.tertiary)
            } else {
                Button {
                    self.dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .fontWeight(.medium)
                }
                .keyboardShortcut(.cancelAction)
                .tint(.primary)
                .accessibilityLabel(Text("Dismiss", tableName: "AD&InAppPurchase"))
            }
        }
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
            Text("This App shows advertisement about applications on AppStore. These are several Apps by this app's developer. It is activated after you launch this app 5 times.",
                 tableName: "AD&InAppPurchase")
            .padding()
        } header: {
            Text("Description", tableName: "AD&InAppPurchase")
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
        .navigationTitle(Text("About AD", tableName: "AD&InAppPurchase"))
    }
}
