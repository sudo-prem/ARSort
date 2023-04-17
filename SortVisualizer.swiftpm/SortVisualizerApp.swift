import SwiftUI

@main
struct SortVisualizerApp: App {
    var body: some Scene {
        WindowGroup {
            SortVisualizer()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color(.darkGray), Color(.black)]), startPoint: .top, endPoint: .bottom))
        }
    }
}
