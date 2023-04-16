import SwiftUI

struct Edge: Identifiable {
    let id = UUID()
    let from: Node
    let to: Node
}
