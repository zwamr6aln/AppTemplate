import SwiftUI
import StoreKit

struct 📣ADSheet: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @EnvironmentObject var 🛒: 🛒StoreModel
    private var ⓐpp: 📣MyApp
    var body: some View {
        NavigationView {
            Group {
                if self.verticalSizeClass == .regular {
                    self.ⓥerticalLayout()
                } else {
                    self.ⓗorizontalLayout()
                }
            }
            .navigationTitle("AD")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    self.ⓓismissButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    self.ⓐdMenuLink()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    private func ⓥerticalLayout() -> some View {
        VStack(spacing: 16) {
            Spacer()
            self.ⓜockImage()
            Spacer()
            self.ⓘcon()
            self.ⓝame()
            Spacer()
            self.ⓓescription()
            Spacer()
            self.ⓐppStoreBadge()
            Spacer()
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
        Link(destination: self.ⓐpp.url) {
            Image(self.ⓐpp.mockImageName)
                .resizable()
                .scaledToFit()
        }
        .accessibilityHidden(true)
    }
    private func ⓘcon() -> some View {
        Link(destination: self.ⓐpp.url) {
            Image(self.ⓐpp.iconImageName)
                .resizable()
                .frame(width: 60, height: 60)
        }
        .accessibilityHidden(true)
    }
    private func ⓝame() -> some View {
        Link(destination: self.ⓐpp.url) {
            Text(self.ⓐpp.name)
                .font(.headline)
        }
        .buttonStyle(.plain)
        .accessibilityHidden(true)
    }
    private func ⓓescription() -> some View {
        Text(self.ⓐpp.description)
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 8)
    }
    private func ⓐppStoreBadge() -> some View {
        Link(destination: self.ⓐpp.url) {
            HStack(spacing: 6) {
                Image("appstore_badge")
                Image(systemName: "hand.point.up.left")
            }
            .foregroundColor(.primary)
        }
    }
    private func ⓐdMenuLink() -> some View {
        NavigationLink {
            📣ADMenu()
        } label: {
            Image(systemName: "questionmark.circle")
                .foregroundColor(.primary)
        }
        .accessibilityLabel("about AD")
    }
    private func ⓓismissButton() -> some View {
        Button {
            🛒.🚩showADSheet = false
        } label: {
            Image(systemName: "chevron.down")
        }
        .foregroundStyle(.primary)
        .accessibilityLabel("dismiss")
    }
    init(_ ⓐpp: 📣MyApp) {
        self.ⓐpp = ⓐpp
    }
}

struct ADSheet_Previews: PreviewProvider {
    static let 🛒 = 🛒StoreModel(id: "PLACEHOLDER.adfree")
    static var previews: some View {
        📣ADSheet(.FlipByBlink)
            .previewInterfaceOrientation(.portrait)
            .environmentObject(🛒)
        📣ADSheet(.LockInNote)
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(🛒)
    }
}

struct 📣ADMenu: View {
    @EnvironmentObject var 🛒: 🛒StoreModel
    var body: some View {
        List {
            Section {
                Text("This App shows banner advertisement about applications on AppStore. These are several Apps by this app's developer. It is activated after you launch this app 5 times.")
                    .padding()
                    .textSelection(.enabled)
            } header: {
                Text("Description")
            }
            🛒IAPSection()
        }
        .navigationTitle("AD / Purchase")
    }
}

struct 📣ADMenuLink: View {
    @EnvironmentObject var 🛒: 🛒StoreModel
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

enum 📣MyApp: String, CaseIterable {
    case FlipByBlink
    case FadeInAlarm
    case Plain将棋盤
    case TapWeight
    case TapTemperature
    case MemorizeWidget
    case LockInNote
    
    var name: LocalizedStringKey {
        LocalizedStringKey(self.rawValue)
    }
    
    var url: URL {
        switch self {
            case .FlipByBlink: return URL(string: "https://apps.apple.com/app/id1444571751")!
            case .FadeInAlarm: return URL(string: "https://apps.apple.com/app/id1465336070")!
            case .Plain将棋盤: return URL(string: "https://apps.apple.com/app/id1620268476")!
            case .TapWeight: return URL(string: "https://apps.apple.com/app/id1624159721")!
            case .TapTemperature: return URL(string: "https://apps.apple.com/app/id1626760566")!
            case .MemorizeWidget: return URL(string: "https://apps.apple.com/app/id1644276262")!
            case .LockInNote: return URL(string: "https://apps.apple.com/app/id1644879340")!
        }
    }
    
    var description: LocalizedStringKey {
        switch self {
            case .FlipByBlink: return "Simple and normal ebook reader (for fixed-layout). Only a special feature. Turn a page with slightly longish voluntary blink."
            case .FadeInAlarm: return "Alarm clock with taking a long time from small volume to max volume."
            case .Plain将棋盤: return "Simple Shogi board App. Based on iOS system UI design."
            case .TapWeight: return "Register weight data to the Apple \"Health\" application pre-installed on iPhone in the fastest possible way (as manual)."
            case .TapTemperature: return "Register body temperature data to the \"Health\" app pre-installed on iPhone in the fastest possible way (as manual)."
            case .MemorizeWidget: return "Flashcard on widget. Memorize a note in everyday life."
            case .LockInNote: return "Notes widget on lock screen."
        }
    }
    
    var mockImageName: String {
        "mock/" + self.rawValue
    }
    
    var iconImageName: String {
        "icon/" + self.rawValue
    }
    
    static func pickUpAppWithout(_ ⓜySelf: Self) -> Self {
        let ⓐpps = 📣MyApp.allCases.filter { $0 != ⓜySelf }
        return ⓐpps.randomElement()!
    }
}
