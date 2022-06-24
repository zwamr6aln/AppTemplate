
import SwiftUI

struct 🔗OpenSystemSetting: View {
    var body: some View {
        Button {
            let 🔗 = URL(string: UIApplication.openSettingsURLString)!
            UIApplication.shared.open(🔗)
        } label: {
            Label("Open system Setting", systemImage: "gearshape")
        }
    }
}
