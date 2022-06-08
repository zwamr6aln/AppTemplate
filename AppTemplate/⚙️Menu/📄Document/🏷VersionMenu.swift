
import SwiftUI

struct 🏷VersionMenu: View {
    var body: some View {
        Section {
            NavigationLink {
                ScrollView {
                    📋TextView(🕒VersionHistory, "Version History")
                }
            } label: {
                Label("1.0" , systemImage: "signpost.left")
            }
        } header: {
            Text("Version")
        } footer: {
            let 📅 = Date.now.formatted(date: .numeric, time: .omitted)
            Text("builded on \(📅)")
        }
    }
}

let 🕒VersionHistory = """
🕒 Version 1.1 : (2022-AA-AA?)
==== English Description ====
- AAAA
==== Japanese(native) description ====
- AAAA


🕒 Version 1.0 : 2022-AA-AA
Initial release
"""
