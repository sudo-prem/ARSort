import SwiftUI

@main
struct SortVisualizerApp: App {
    var body: some Scene {
        WindowGroup {
            GeometryReader { geometry in
                SortVisualizer()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.darkGray), Color(.black)]), startPoint: .top, endPoint: .bottom))
            }
        }
    }
}
