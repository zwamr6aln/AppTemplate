
let 🕒LatestVersionNumber = "1.1"

let 🕒LatestVersionDescription = """
==== English ====
- AAAA
- Various bugfixes and improvements.
==== Japanese(native) ====
- ああああ
- いくつかの改善やバグ修正を行いました。
"""

let 🕒PastVersionHistory = """
🕒 Version 1.0 : 2022-AA-AA
Initial release
最初のリリース
"""


import SwiftUI

struct 🕒VersionHistoryLink: View {
    var body: some View {
        Section {
            NavigationLink {
                ScrollView {
                    Text(🕒VersionHistory)
                        .padding()
                }
                .navigationBarTitle("Version History")
                .navigationBarTitleDisplayMode(.inline)
                .textSelection(.enabled)
            } label: {
                Label(🕒LatestVersionNumber, systemImage: "signpost.left")
            }
            .accessibilityLabel("Version History")
        } header: {
            Text("Version")
        } footer: {
            let 📅 = Date.now.formatted(date: .long, time: .omitted)
            Text("builded on \(📅)")
        }
    }
}

var 🕒VersionHistory: String {
    var 📃 = "🕒 Version " + 🕒LatestVersionNumber + " : "
    📃 += ("(" + Date.now.formatted(date: .long, time: .omitted) + " build)\n")
    📃 += 🕒LatestVersionDescription + "\n\n\n"
    📃 += 🕒PastVersionHistory
    return 📃
}
