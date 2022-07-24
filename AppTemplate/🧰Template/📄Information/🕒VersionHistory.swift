
let 🕒VersionNumber = "2.0"


import SwiftUI

struct 🕒VersionHistoryLink: View {
    var body: some View {
        Section {
            NavigationLink {
                List {
                    Section {
                        Text(LocalizedStringKey(🕒VersionNumber), tableName: "VersionDescription")
                            .font(.subheadline)
                            .padding()
                    } header: {
                        Text(🕒VersionNumber)
                    } footer: {
                        let 📅 = Date.now.formatted(date: .long, time: .omitted)
                        Text("builded on \(📅)")
                    }
                    .headerProminence(.increased)
                    
                    ForEach(🕒VersionHistoryData, id: \.self.0) { 📃 in
                        🕒VersionSection(📃)
                    }
                }
                .navigationBarTitle("Version History")
                .navigationBarTitleDisplayMode(.inline)
                .textSelection(.enabled)
            } label: {
                Label(🕒VersionNumber, systemImage: "signpost.left")
            }
            .accessibilityLabel("Version History")
        } header: {
            Text("Version")
        }
    }
}

struct 🕒VersionSection: View {
    var ⓝumber: String
    var ⓓate: String
    
    var body: some View {
        Section {
            Text(LocalizedStringKey(ⓝumber), tableName: "VersionDescription")
                .font(.subheadline)
                .padding()
        } header: {
            Text(ⓝumber)
        } footer: {
            Text(ⓓate)
        }
        .headerProminence(.increased)
    }
    
    init(_ 📃: (String, String)) {
        ⓝumber = 📃.0
        ⓓate = 📃.1
    }
}

let 🕒VersionHistoryData: [(String, String)] = [("1.2","2022-03-01"),
                                                ("1.1","2022-02-01"),
                                                ("1.0","2022-01-01")]
