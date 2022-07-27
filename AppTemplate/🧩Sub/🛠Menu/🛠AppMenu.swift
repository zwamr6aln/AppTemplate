
import SwiftUI

struct 🛠AppMenu: View {
    @EnvironmentObject var 📱: 📱AppModel
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Toggle(isOn: .constant(false)) {
                        Label("placeholder", systemImage: "questionmark")
                    }
                } header: { Text("Option") }
                
                ℹ️AboutAppLink()
                📣ADMenuLink()
            }
            .navigationTitle("Menu")
            .toolbar { ﹀CloseMenuButton($📱.🚩ShowMenu) }
        }
        .onDisappear { 📱.🚩ShowMenu = false }
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
                            .font(.title)
                            .fontWeight(.bold)
                            .tracking(1.5)
                            .opacity(0.8)
                        
                        Text("Application for iPhone / iPad")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundStyle(.secondary)
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                }
                .padding(20)
                .padding(.top, 6)
            }
            
            Link(destination: 🔗AppStoreProductURL) {
                HStack {
                    Label("Open AppStore page", systemImage: "link")
                    Spacer()
                    Image(systemName: "arrow.up.forward.app")
                }
            }
            
            NavigationLink  {
                ℹ️AboutAppMenu()
            } label: {
                Label("About App", systemImage: "doc")
            }
        }
    }
}

struct ﹀CloseMenuButton: ToolbarContent {
    @Binding var 🚩ShowMenu: Bool
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                🚩ShowMenu = false
                UISelectionFeedbackGenerator().selectionChanged()
            } label: {
                Image(systemName: "chevron.down")
                    .foregroundStyle(.secondary)
                    .grayscale(1.0)
                    .padding(8)
            }
            .accessibilityLabel("Dismiss")
        }
    }
    
    init(_ 🚩: Binding<Bool>) {
        _🚩ShowMenu = 🚩
    }
}


struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ℹ️AboutAppLink()
        }
    }
}
