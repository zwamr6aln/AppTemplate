
import SwiftUI

struct 🏷VersionSection: View {
    var body: some View {
        Section {
            NavigationLink {
                📋TextView(🕒VersionHistory, "Version History")
            } label: {
                Label(🕒LatestVersionNumber, systemImage: "signpost.left")
            }
            .accessibilityLabel("Open version history")
        } header: {
            Text("Version")
        } footer: {
            let 📅 = Date.now.formatted(date: .numeric, time: .omitted)
            Text("builded on \(📅)")
        }
    }
}


let 🕒LatestVersionNumber = "1.1"

let 🕒LatestVersionDescription = """
==== English description ====
- AAAA
==== Japanese(native) description ====
- AAAA
"""

var 🕒VersionHistory: String {
    var 📃 = "🕒 Version " + 🕒LatestVersionNumber + " : "
    📃 += "(builded on " + Date.now.formatted(date: .numeric, time: .omitted) + ")\n"
    📃 += 🕒LatestVersionDescription + "\n\n\n"
    📃 += 🕒PastVersionHistory
    return 📃
}

let 🕒PastVersionHistory = """
🕒 Version 1.0 : 2022-AA-AA
Initial release
"""
