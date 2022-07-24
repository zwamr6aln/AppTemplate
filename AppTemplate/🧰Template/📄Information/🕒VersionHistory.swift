
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
                    
                    ForEach(🕒VersionHistoryData, id: \.self.number) { 📃 in
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
    var 📃: 🕒VersionFormat
    
    var body: some View {
        Section {
            Text(LocalizedStringKey(📃.number), tableName: "VersionDescription")
                .font(.subheadline)
                .padding()
        } header: {
            Text(📃.number)
        } footer: {
            Text(📃.date)
        }
        .headerProminence(.increased)
    }
    
    init(_ 📃: 🕒VersionFormat) {
        self.📃 = 📃
    }
}

typealias 🕒VersionFormat = (number: String, date: String)

let 🕒VersionHistoryData: [🕒VersionFormat] = [
    ("1.2","2022-03-01"),
    ("1.1","2022-02-01"),
    ("1.0","2022-01-01")]
