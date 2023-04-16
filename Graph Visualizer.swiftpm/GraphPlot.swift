import SwiftUI

struct GraphPlot: View {
    let nodes: [Node]
    let edges: [Edge]
    let nodeSize: CGSize
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(edges) { edge in
                    let fromPoint = edge.from.position
                    let toPoint = edge.to.position
                    Path { path in
                        path.move(to: fromPoint)
                        path.addLine(to: toPoint)
                    }.stroke(lineWidth: 2)
                }
                
                ForEach(nodes) { node in
                    let position = node.position
                    Text(node.name)
                        .font(.system(size: nodeSize.width / 3)) // adjust font size
                        .foregroundColor(.white)
                        .background(Circle().fill(Color.blue).frame(width: 60, height: 60)) // increase size of circle
                        .frame(width: nodeSize.width, height: nodeSize.height)
                        .position(position)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
