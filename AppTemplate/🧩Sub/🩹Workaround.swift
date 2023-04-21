import SwiftUI

enum 🩹Workaround {
    struct closeMenePopup: ViewModifier {
        @Environment(\.scenePhase) private var scenePhase
        func body(content: Content) -> some View {
            content
                .onChange(of: self.scenePhase) { [scenePhase] ⓝewValue in
                    if scenePhase == .active, ⓝewValue == .inactive {
                        self.closeMenuPopup()
                    }
                }
        }
        private func closeMenuPopup() {
            let ⓢcene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            ⓢcene?.windows.first?.rootViewController?.dismiss(animated: true)
        }
        //Conflict error Menu-popup / sheetPresentation
        //> [Presentation]
        //> Attempt to present <_> on <_> (from <_>)
        //> which is already presenting <_UIContextMenuActionsOnlyViewController: _>.
    }
    struct hideTitleBarOnMacCatalyst: ViewModifier {
        func body(content: Content) -> some View {
            content
                .onAppear {
#if targetEnvironment(macCatalyst)
                    let ⓢcene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                    ⓢcene?.titlebar?.titleVisibility = .hidden
#endif
                }
        }
    }
}
