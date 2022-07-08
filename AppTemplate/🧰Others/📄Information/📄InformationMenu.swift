
import SwiftUI

struct 📄InformationMenuLink: View {
    var body: some View {
        NavigationLink {
            📄InformationMenu()
        } label: {
            Label("Information", systemImage: "doc")
        }
    }
}

struct 📄InformationMenu: View {
    var body: some View {
        List {
            📰DescriptionSection()
            🔗AppStoreLink()
            👤PrivacyPolicySection()
            🕒VersionHistoryLink()
            📓SourceCodeLink()
            🧑‍💻AboutDeveloperPublisherLink()
        }
        .navigationTitle("Information")
    }
}

struct 📰DescriptionSection: View {
    var body: some View {
        Section {
            NavigationLink {
                ScrollView {
                    Text("🌏AppStoreDescription")
                        .padding()
                }
                .navigationBarTitle("About")
                .navigationBarTitleDisplayMode(.inline)
                .textSelection(.enabled)
            } label: {
                Text("🌏AppStoreDescription")
                    .font(.subheadline)
                    .lineLimit(4)
                    .padding(8)
                    .accessibilityLabel("About")
            }
        } header: { Text("About") }
    }
}

struct 🔗AppStoreLink: View {
    var body: some View {
        let 🔗 = "https://apps.apple.com/app/id1111" //FIXME: AppStore URL
        Section {
            Link(destination: URL(string: 🔗)!) {
                HStack {
                    Label("Open AppStore page", systemImage: "link")
                    Spacer()
                    Image(systemName: "arrow.up.forward.app")
                }
            }
        } footer: { Text(🔗) }
    }
}

struct 👤PrivacyPolicySection: View {
    var body: some View {
        Section {
            NavigationLink {
                Text("""
                2022-AA-AA

                (English)This application don't collect user infomation.

                (Japanese)このアプリ自身において、ユーザーの情報を一切収集しません。
                """) //FIXME: Privacy Policy
                .padding(32)
                .textSelection(.enabled)
                .navigationTitle("Privacy Policy")
            } label: {
                Label("Privacy Policy", systemImage: "person.text.rectangle")
            }
        }
    }
}
