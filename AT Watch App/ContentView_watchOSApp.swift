import SwiftUI

struct ContentView_watchOSApp: View {
    var body: some View {
        NavigationStack {
            List {
                💁GuideMenu()
            }
            .navigationTitle("AppTemplate")
        }
    }
}

private struct 💁GuideMenu: View {
    var body: some View {
        NavigationLink {
            List {
                ZStack {
                    Color.clear
                    VStack(spacing: 8) {
                        Image("IconImage")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        VStack(spacing: 6) {
                            Text(ℹ️appName)
                                .font(.system(.headline))
                                .tracking(1.5)
                                .opacity(0.75)
                            Text(ℹ️appSubTitle)
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.center)
                        }
                        .lineLimit(2)
                        .minimumScaleFactor(0.1)
                    }
                    .padding(.horizontal, 4)
                    .padding(.vertical, 16)
                }
                Link(destination: 🔗appStoreProductURL) {
                    Label("Open AppStore page", systemImage: "link")
                }
            }
        } label: {
            Label("About App", systemImage: "questionmark")
        }
    }
}
