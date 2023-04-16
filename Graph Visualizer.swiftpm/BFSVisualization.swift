import SwiftUI

struct BFSVisualization: View {
    let nodes: [Node]
    let edges: [Edge]
    let nodeSize: CGSize
    
    @State private var visitedNodes = Set<Node>()
    @State private var traversalOrder: [Node] = []
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                GraphPlot(nodes: nodes, edges: edges, nodeSize: nodeSize)
                    .onAppear {
                        bfs(startNode: nodes.first)
                    }
                
                ForEach(traversalOrder, id: \.self) { node in
                    Circle()
                        .fill(Color.red)
                        .frame(width: nodeSize.width * 1.5, height: nodeSize.height * 1.5)
                        .position(node.position)
                        .transition(.scale)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
    private func bfs(startNode: Node?) {
        guard let startNode = startNode else {
            return
        }
        
        var queue = [startNode]
        visitedNodes.insert(startNode)
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            traversalOrder.append(node)
            
            for edge in edges where edge.from == node && !visitedNodes.contains(edge.to) {
                visitedNodes.insert(edge.to)
                queue.append(edge.to)
            }
        }
    }
}
