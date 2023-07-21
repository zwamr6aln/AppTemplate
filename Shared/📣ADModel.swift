import SwiftUI

enum 📣ADTargetApp: String, CaseIterable {
    case FlipByBlink
    case FadeInAlarm
    case PlainShogiBoard
    case TapWeight
    case TapTemperature
    case MemorizeWidget
    case LockInNote
    
    var name: LocalizedStringKey { .init(self.rawValue) }
    
    var url: URL {
        switch self {
            case .FlipByBlink: URL(string: "https://apps.apple.com/app/id1444571751")!
            case .FadeInAlarm: URL(string: "https://apps.apple.com/app/id1465336070")!
            case .PlainShogiBoard: URL(string: "https://apps.apple.com/app/id1620268476")!
            case .TapWeight: URL(string: "https://apps.apple.com/app/id1624159721")!
            case .TapTemperature: URL(string: "https://apps.apple.com/app/id1626760566")!
            case .MemorizeWidget: URL(string: "https://apps.apple.com/app/id1644276262")!
            case .LockInNote: URL(string: "https://apps.apple.com/app/id1644879340")!
        }
    }
    
    var description: LocalizedStringKey {
        switch self {
            case .FlipByBlink: "E-book reader that can turn a page with slightly longish voluntary blink."
            case .FadeInAlarm: "Alarm clock with taking a long time from small volume to max volume."
            case .PlainShogiBoard: "Simplest Shogi board App. Supported SharePlay."
            case .TapWeight: "Register weight data to \"Health\" app pre-installed on iPhone in the fastest way (as manual)."
            case .TapTemperature: "Register body temperature data to \"Health\" app pre-installed on iPhone in the fastest way (as manual)."
            case .MemorizeWidget: "Flashcard on widget. Memorize a note in everyday life."
            case .LockInNote: "Notes widget on lock screen."
        }
    }
    
    var mockImageName: String { "mock/" + self.rawValue }
    
    var iconImageName: String { "icon/" + self.rawValue }
    
    static func pickUpAppWithout(_ ⓜySelf: Self) -> Self { .allCases.filter({ $0 != ⓜySelf }).randomElement()! }
    
    var isHealthKitApp: Bool { [Self.TapTemperature, .TapWeight].contains(self) }
}
