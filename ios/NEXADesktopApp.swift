import SwiftUI

@main
struct NEXADesktopApp: App {
    var body: some Scene {
        WindowGroup {
            DesktopView()
                .preferredColorScheme(.dark)
        }
    }
}