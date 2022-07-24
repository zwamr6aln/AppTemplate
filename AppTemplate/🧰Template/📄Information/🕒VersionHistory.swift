
let 🕒VersionNumber = "2.0"

let 🕒VersionDescription = """
AAAA
Various bugfixes and improvements.
ああああ
いくつかの改善やバグ修正を行いました。
"""


import SwiftUI

struct 🕒VersionHistoryLink: View {
    var body: some View {
        Section {
            NavigationLink {
                List {
                    let 📅 = Date.now.formatted(date: .long, time: .omitted)
                    🕒VersionSection((🕒VersionNumber,
                                      🕒VersionDescription,
                                      "builded on \(📅)"))
                    
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
            Text(📃.text)
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

typealias 🕒VersionFormat = (number: String, text: String, date: LocalizedStringKey)

let 🕒VersionHistoryData: [🕒VersionFormat] = [
    ("1.2","""
            Third release
            3回目のリリース
            ""","2022-03-01"),
    ("1.1","""
            Second release
            2回目のリリース
            ""","2022-02-01"),
    ("1.0","""
            Initial release
            最初のリリース
            ""","2022-01-01")]
