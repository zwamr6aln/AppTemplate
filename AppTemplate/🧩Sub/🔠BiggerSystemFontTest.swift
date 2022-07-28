
import SwiftUI

struct 🔠BiggerSystemFontTest: View {
    @State private var 🔠FontSize: CGFloat = 🔠computeFontSize()
    @Environment(\.dynamicTypeSize) var DTS: DynamicTypeSize
    
    var body: some View {
        Text("LargeTitle(plain)")
            .font(.largeTitle.weight(.black))
        
        Text("LargeTitle(func)")
            .font(.system(size: 🔠FontSize).weight(.black))
            .onChange(of: DTS) { _ in
                🔠FontSize = 🔠computeFontSize()
            }
        
        Text("LargeTitle(extension)")
            .font(.system(size: UIFont.textStyleSize(.largeTitle)*1.2, weight: .black))
    }
}

func 🔠computeFontSize() -> CGFloat {
    UIFont.preferredFont(forTextStyle: .largeTitle).pointSize * 1.2
}

public extension UIFont {
    static func textStyleSize(_ style: UIFont.TextStyle) -> CGFloat {
        UIFont.preferredFont(forTextStyle: style).pointSize
    }
}
