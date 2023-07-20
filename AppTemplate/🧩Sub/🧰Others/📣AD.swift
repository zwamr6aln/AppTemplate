import SwiftUI
import StoreKit

//struct 📣ADSheet: ViewModifier {
//    @EnvironmentObject var 🛒: 🛒StoreModel
//    @State private var ⓐpp: 📣MyApp = .pickUpAppWithout(.ONESELF)
//    func body(content: Content) -> some View {
//        content
//            .sheet(isPresented: $🛒.🚩showADSheet) { 📣ADView(self.ⓐpp) }
//            .onAppear { 🛒.checkToShowADSheet() }
//    }
//}

struct 📣ADView: View {
    @EnvironmentObject private var 🛒: 🛒StoreModel
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @Environment(\.dismiss) private var dismiss
    @State private var disableDismiss: Bool = true
    private let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    @State private var countdown: Int
    private var targetApp: 📣MyApp
    @State private var showADMenu: Bool = false
    var body: some View {
        NavigationStack { self.ⓒontent() }
            .presentationDetents([.height(640)])
            .onChange(of: self.scenePhase) {
                if $0 == .background { self.dismiss() }
            }
            .onChange(of: 🛒.🚩purchased) { if $0 { self.disableDismiss = false } }
            .interactiveDismissDisabled(self.disableDismiss)
            .onReceive(self.timer) { _ in
                if self.countdown > 1 {
                    self.countdown -= 1
                } else {
                    self.disableDismiss = false
                }
            }
            .overlay(alignment: .topLeading) {
                HStack {
                    if !self.showADMenu {
                        self.ⓓismissButton()
                        Spacer()
                        self.ⓐdMenuLink()
                    }
                }
                .font(.title3)
                .padding(.top, 12)
                .padding(.horizontal, 18)
                .animation(.default, value: self.disableDismiss)
                .animation(.default, value: self.showADMenu)
            }
    }
    private func ⓒontent() -> some View {
        Group {
            if self.verticalSizeClass == .compact {
                self.ⓗorizontalLayout()
            } else {
                self.ⓥerticalLayout()
            }
        }
        .modifier(Self.🄿urchasedEffect())
        .navigationTitle("AD")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: self.$showADMenu) { 📣ADMenu() }
    }
    private func ⓥerticalLayout() -> some View {
        VStack(spacing: 16) {
            Spacer(minLength: 0)
            self.ⓜockImage()
            Spacer(minLength: 0)
            self.ⓘcon()
            self.ⓝame()
            Spacer(minLength: 0)
            self.ⓓescription()
            Spacer(minLength: 0)
            self.ⓐppStoreBadge()
            Spacer(minLength: 0)
        }
        .padding()
    }
    private func ⓗorizontalLayout() -> some View {
        HStack(spacing: 16) {
            self.ⓜockImage()
            VStack(spacing: 12) {
                Spacer()
                self.ⓘcon()
                self.ⓝame()
                self.ⓓescription()
                Spacer()
                self.ⓐppStoreBadge()
                Spacer()
            }
            .padding(.horizontal)
        }
        .padding()
    }
    private func ⓜockImage() -> some View {
        Link(destination: self.targetApp.url) {
            Image(self.targetApp.mockImageName)
                .resizable()
                .scaledToFit()
        }
        .accessibilityHidden(true)
        .disabled(🛒.🚩purchased)
    }
    private func ⓘcon() -> some View {
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
        .disabled(🛒.🚩purchased)
    }
    private func ⓝame() -> some View {
        Link(destination: self.targetApp.url) {
            Text(self.targetApp.name)
                .font(.headline)
        }
        .buttonStyle(.plain)
        .accessibilityHidden(true)
        .disabled(🛒.🚩purchased)
    }
    private func ⓓescription() -> some View {
        Text(self.targetApp.description)
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 8)
    }
    private func ⓐppStoreBadge() -> some View {
        Link(destination: self.targetApp.url) {
            HStack(spacing: 6) {
                Image(.appstoreBadge)
                Image(systemName: "hand.point.up.left")
            }
            .foregroundColor(.primary)
        }
        .accessibilityLabel("Open AppStore page")
        .disabled(🛒.🚩purchased)
    }
    private func ⓐdMenuLink() -> some View {
        Button {
            self.showADMenu = true
        } label: {
            Image(systemName: "questionmark.circle")
        }
        .tint(.primary)
        .accessibilityLabel("About AD")
    }
    private func ⓓismissButton() -> some View {
        Group {
            if self.disableDismiss {
                Image(systemName: "\(self.countdown).circle")
                    .foregroundStyle(.tertiary)
            } else {
                Button {
                    self.dismiss()
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .fontWeight(.medium)
                }
                .keyboardShortcut(.cancelAction)
                .tint(.primary)
                .accessibilityLabel("Dismiss")
            }
        }
    }
    private struct 🄿urchasedEffect: ViewModifier {
        @EnvironmentObject private var 🛒: 🛒StoreModel
        func body(content: Content) -> some View {
            if 🛒.🚩purchased {
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
    init(_ app: 📣MyApp, second: Int) {
        self.targetApp = app
        self._countdown = State(initialValue: second)
    }
}

struct 📣ADDescriptionSection: View {
    var body: some View {
        Section {
            Text("This App shows advertisement about applications on AppStore. These are several Apps by this app's developer. It is activated after you launch this app 5 times.")
                .padding()
        } header: {
            Text("Description")
        }
    }
}

struct 📣ADMenuLink: View {
    @EnvironmentObject private var 🛒: 🛒StoreModel
    var body: some View {
        Section {
            🛒PurchaseView()
            NavigationLink {
                📣ADMenu()
            } label: {
                Label("About AD / Purchase", systemImage: "megaphone")
            }
        } header: {
            Text("AD / Purchase")
        }
    }
}

struct 📣ADMenu: View {
    @EnvironmentObject private var 🛒: 🛒StoreModel
    var body: some View {
        List {
            📣ADDescriptionSection()
            🛒IAPSection()
        }
        .navigationTitle("About AD")
        .navigationBarTitleDisplayMode(.large)
    }
}

enum 📣MyApp: String, CaseIterable {
    case FlipByBlink
    case FadeInAlarm
    case PlainShogiBoard
    case TapWeight
    case TapTemperature
    case MemorizeWidget
    case LockInNote
    
    var name: LocalizedStringKey { .init(self.rawValue) }
    
    var url: URL {
        switch self {
            case .FlipByBlink: URL(string: "https://apps.apple.com/app/id1444571751")!
            case .FadeInAlarm: URL(string: "https://apps.apple.com/app/id1465336070")!
            case .PlainShogiBoard: URL(string: "https://apps.apple.com/app/id1620268476")!
            case .TapWeight: URL(string: "https://apps.apple.com/app/id1624159721")!
            case .TapTemperature: URL(string: "https://apps.apple.com/app/id1626760566")!
            case .MemorizeWidget: URL(string: "https://apps.apple.com/app/id1644276262")!
            case .LockInNote: URL(string: "https://apps.apple.com/app/id1644879340")!
        }
    }
    
    var description: LocalizedStringKey {
        switch self {
            case .FlipByBlink: "E-book reader that can turn a page with slightly longish voluntary blink."
            case .FadeInAlarm: "Alarm clock with taking a long time from small volume to max volume."
            case .PlainShogiBoard: "Simplest Shogi board App. Supported SharePlay."
            case .TapWeight: "Register weight data to \"Health\" app pre-installed on iPhone in the fastest way (as manual)."
            case .TapTemperature: "Register body temperature data to \"Health\" app pre-installed on iPhone in the fastest way (as manual)."
            case .MemorizeWidget: "Flashcard on widget. Memorize a note in everyday life."
            case .LockInNote: "Notes widget on lock screen."
        }
    }
    
    var mockImageName: String { "mock/" + self.rawValue }
    
    var iconImageName: String { "icon/" + self.rawValue }
    
    static func pickUpAppWithout(_ ⓜySelf: Self) -> Self { .allCases.filter({ $0 != ⓜySelf }).randomElement()! }
    
    var isHealthKitApp: Bool { [Self.TapTemperature, .TapWeight].contains(self) }
}
