
import SwiftUI

struct 🔗OpenSystemSetting: View {
    var body: some View {
        Button {
            UIApplication.shared.open (
                URL(string: UIApplication.openSettingsURLString)!
            )
        } label: {
            Label("Open \"Setting\" app", systemImage: "gearshape")
        }
    }
}
