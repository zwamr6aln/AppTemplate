
import SwiftUI

struct 🔠BiggerSystemFontTest: View {
    @State private var 🔠FontSize: CGFloat = 🔠computeFontSize()
    @Environment(\.dynamicTypeSize) var DTS: DynamicTypeSize
    
    var body: some View {
        Text("LargeTitle(plain)")
            .font(.largeTitle.weight(.black))
        
        Text("LargeTitle(update)")
            .font(.system(size: 🔠FontSize).weight(.black))
            .onChange(of: DTS) { _ in
                🔠FontSize = 🔠computeFontSize()
            }
    }
}

func 🔠computeFontSize() -> CGFloat {
    UIFont.preferredFont(forTextStyle: .largeTitle).pointSize * 1.2
}
