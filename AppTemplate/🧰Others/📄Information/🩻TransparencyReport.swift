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
                🧑‍💻AboutDeveloperPublisher()
            } label: {
                Label("Developer / Publisher", systemImage: "person")
            }
            
            NavigationLink {
                📃AboutAppStoreRelease()
            } label: {
                Label("AppStore Release", systemImage: "a.square")
            }
        }
        .navigationTitle("Transparency Report")
    }
}


struct 🧑‍💻AboutDeveloperPublisher: View {
    var body: some View {
        List {
            Section {
                Text("Individual")
            } header: {
                Text("The System")
            }
            
            
            Section {
                Text("山下 亮")
                
                Text("やました りょう (ひらがな)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text("Yamashita Ryo (alphabet)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            } header: {
                Text("Name")
            } footer: {
                Text("only one person")
            }
            
            
            Section {
                HStack {
                    Text("age")
                    Spacer()
                    Text("about 28")
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("country")
                    Spacer()
                    Text("Japan")
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("native language")
                    Spacer()
                    Text("Japanese")
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("income")
                    Spacer()
                    Text("almost nothing")
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("identity / circumstance / background")
            } footer: {
                Text("As of 2021")
            }
            
            
            Section {
                Image("Developer_Publisher")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding()
                    .opacity(0.5)
            } header: {
                Text("Image")
            } footer: {
                Text("Taken on 2021-11")
            }
        }
        .navigationTitle("Developer / Publisher")
    }
}


struct 📃AboutAppStoreRelease: View { //TODO: 再検討
    var body: some View {
        List {
            Section {
                Text("4+")
            } header: {
                Text("Age rating")
            }

            Section {
                Text("It is distributed to all (175) available countries or regions. It will also be automatically published to any new countries or regions that become available for distribution on AppStore.")
                    .padding()
            } header: {
                Text("Availability")
            }

            Section {
                Text("placeholder") //FIXME: "enable", "disable"
                    .redacted(reason: .placeholder)
            } header: {
                Text("Compatibility with Apple Silicon mac")
            }
        }
        .navigationTitle("AppStore Release")
    }
}
