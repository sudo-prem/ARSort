import SwiftUI

struct Node: Identifiable, Hashable, Equatable {
    let id = UUID()
    let name: String
    var position: CGPoint
}
