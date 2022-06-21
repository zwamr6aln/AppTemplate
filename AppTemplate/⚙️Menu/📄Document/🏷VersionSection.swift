
import SwiftUI

struct 🏷VersionSection: View {
    var body: some View {
        Section {
            NavigationLink {
                📋TextView(🕒VersionHistory, "Version History")
            } label: {
                Label(🕒LatestVersion, systemImage: "signpost.left")
            }
            .accessibilityLabel("Open version history")
        } header: {
            Text("Version")
        } footer: {
            let 📅 = Date.now.formatted(date: .numeric, time: .omitted)
            Text(LocalizedStringKey("builded on \(📅)"))
        }
    }
}

let 🕒LatestVersion = "1.0"

let 🕒VersionHistory = """
🕒 Version 1.1 : (2022-AA-AA?)
==== English description ====
- AAAA
==== Japanese(native) description ====
- AAAA


🕒 Version 1.0 : 2022-AA-AA
Initial release
"""
