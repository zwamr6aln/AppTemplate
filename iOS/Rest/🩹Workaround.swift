import SwiftUI

enum 🩹Workaround {
    struct CloseMenuPopup: ViewModifier {
        @Environment(\.scenePhase) var scenePhase
        func body(content: Content) -> some View {
            content
                .onChange(of: self.scenePhase) { oldValue, newValue in
                    if oldValue == .active, newValue == .inactive {
                        self.closeMenuPopup()
                    }
                }
        }
        private func closeMenuPopup() {
            (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
                .windows
                .first?
                .rootViewController?
                .dismiss(animated: true)
        }
        //Conflict error Menu-popup / sheetPresentation
        //> [Presentation]
        //> Attempt to present <_> on <_> (from <_>)
        //> which is already presenting <_UIContextMenuActionsOnlyViewController: _>.
    }
    
    struct HideTitleBarOnMacCatalyst: ViewModifier {
        func body(content: Content) -> some View {
            content
                .onAppear {
#if targetEnvironment(macCatalyst)
                    (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
                        .titlebar?
                        .titleVisibility = .hidden
#endif
                }
        }
    }
}
