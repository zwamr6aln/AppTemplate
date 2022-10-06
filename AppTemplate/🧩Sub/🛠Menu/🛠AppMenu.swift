
import SwiftUI

struct 🛠AppMenu: View {
    @EnvironmentObject var 📱: 📱AppModel
    @Environment(\.dismiss) var 🔙Dismiss: DismissAction
    var body: some View {
        NavigationView {
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
            .toolbar { ﹀CloseMenuButton(🔙Dismiss) }
        }
    }
}

struct ℹ️AboutAppLink: View {
    var body: some View {
        Section {
            ZStack {
                Color.clear
                VStack(spacing: 12) {
                    Image("FlipByBlink")
                        .resizable()
                        .mask {
                            RoundedRectangle(cornerRadius: 22.5, style: .continuous)
                        }
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
                .padding(24)
                .padding(.top, 12)
            }
            
            🔗AppStoreLink()
            
            NavigationLink  {
                ℹ️AboutAppMenu()
            } label: {
                Label("About App", systemImage: "doc")
            }
        }
    }
}

struct ﹀CloseMenuButton: View {
    var 🔙Dismiss: DismissAction
    var body: some View {
        Button {
            🔙Dismiss.callAsFunction()
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        } label: {
            Image(systemName: "chevron.down")
                .foregroundStyle(.secondary)
                .grayscale(1.0)
                .padding(8)
        }
        .accessibilityLabel("Dismiss")
    }
    init(_ 🔙Dismiss: DismissAction) {
        self.🔙Dismiss = 🔙Dismiss
    }
}

struct ﹀DismissButton: View {
    var ﹀Dismiss: DismissAction? = nil
    @Binding var 🚩ShowSheet: Bool
    var body: some View {
        Button {
            if let ﹀Dismiss {
                ﹀Dismiss.callAsFunction()
            } else {
                🚩ShowSheet = false
            }
            UISelectionFeedbackGenerator().selectionChanged()
        } label: {
            Image(systemName: "chevron.down")
        }
        .tint(.secondary)
        .accessibilityLabel("Dismiss")
    }
    init(_ ﹀Dismiss: DismissAction) {
        self.﹀Dismiss = ﹀Dismiss
        self._🚩ShowSheet = .constant(false)
    }
    init(_ 🚩ShowSheet: Binding<Bool>) {
        self._🚩ShowSheet = 🚩ShowSheet
    }
}




struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ℹ️AboutAppLink()
        }
    }
}
