// ⚠️ Work in progress ⚠️

import SwiftUI

struct 🩻TransparencyReportLink: View {
    var body: some View {
        Section {
            NavigationLink {
                🩻TransparencyReportMenu()
            } label: {
                Label("Transparency Report", systemImage: "questionmark.app.dashed")
            }
        } header: {
            Text("🩻TransparencyReport")
        }
    }
}

struct 🩻TransparencyReportMenu: View {
    var body: some View {
        List {
            NavigationLink {
                📓SourceCodeMenu()
            } label: {
                Label("Source code", systemImage: "doc.plaintext")
            }
            
            NavigationLink {
                🧑‍💻AboutDeveloperPublisherLink.🧑‍💻AboutDeveloperPublisherMenu()
            } label: {
                Label("Developer / Publisher", systemImage: "person")
            }
        }
        .navigationTitle("Transparency Report")
    }
}









//                HStack {
//                    Text("income")
//                    Spacer()
//                    Text("almost nothing")
//                        .foregroundStyle(.secondary)
//                }


//            NavigationLink {
//                📃AboutAppStoreRelease()
//            } label: {
//                Label("AppStore Release", systemImage: "a.square")
//            }
//struct 📃AboutAppStoreRelease: View { //TODO: 再検討
//    var body: some View {
//        List {
//            Section {
//                Text("4+")
//            } header: {
//                Text("Age rating")
//            }
//
//            Section {
//                Text("It is distributed to all (175) available countries or regions. It will also be automatically published to any new countries or regions that become available for distribution on AppStore.")
//                    .padding()
//            } header: {
//                Text("Availability")
//            }
//
//            Section {
//                Text("placeholder") // "enable", "disable"
//                    .redacted(reason: .placeholder)
//            } header: {
//                Text("Compatibility with Apple Silicon mac")
//            }
//        }
//        .navigationTitle("AppStore Release")
//    }
//}
