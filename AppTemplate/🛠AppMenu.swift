
import SwiftUI

struct 🛠AppMenu: View {
    @EnvironmentObject var 📱: 📱AppModel
    @Environment(\.dismiss) var ⓓismissAction: DismissAction
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack { 🄲ontents() }
        } else {
            NavigationView { 🄲ontents() }
        }
    }
    func 🄲ontents() -> some View {
        List {
            Section {
                Toggle(isOn: .constant(false)) {
                    Label("placeholder", systemImage: "questionmark")
                }
            } header: {
                Text("Option")
            }
            
            ℹ️AboutAppLink()
            📣ADMenuLink()
        }
        .navigationTitle("Menu")
        .toolbar { ﹀DismissButton(ⓓismissAction) }
    }
}

struct ℹ️AboutAppLink: View {
    var body: some View {
        Section {
            GeometryReader { 📐 in
                VStack(spacing: 12) {
                    Image("FlipByBlink")
                        .resizable()
                        .mask { RoundedRectangle(cornerRadius: 22.5, style: .continuous) }
                        .shadow(radius: 3, y: 1)
                        .frame(width: 100, height: 100)
                    VStack(spacing: 6) {
                        Text("AppTemplate")
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.bold)
                            .tracking(1.5)
                            .opacity(0.75)
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                        Text("Application for iPhone / iPad")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundStyle(.secondary)
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                }
                .padding(20)
                .padding(.top, 8)
                .frame(width: 📐.size.width)
            }
            .frame(height: 200)
            
            🔗AppStoreLink()
            
            NavigationLink  {
                ℹ️AboutAppMenu()
            } label: {
                Label("About App", systemImage: "doc")
            }
        }
    }
}
