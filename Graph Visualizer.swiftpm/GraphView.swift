import SwiftUI

struct GraphView: View {
    @State private var nodes = [Node]()
    @State private var edges = [Edge]()
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Spacer()
                GraphPlot(nodes: nodes, edges: edges, nodeSize: CGSize(width: 50, height: 50))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.clear)
                    .edgesIgnoringSafeArea(.all)
                Spacer()
            }
            Spacer()
            
            Button(action: {
                self.generateRandomGraph()
            }, label: {
                Text("Refresh")
            })
        }
    }
    
    private func generateRandomGraph() {
        let nodeCount = Int.random(in: 5...10)
        var nodes = [Node]()
        for i in 0..<nodeCount {
            let name = "\(i + 1)"
            var position = CGPoint(x: CGFloat.random(in: 50...350), y: CGFloat.random(in: 50...350))
            
            while nodes.contains(where: { node in
                abs(node.position.x - position.x) < 60 && abs(node.position.y - position.y) < 60
            }) {
                position = CGPoint(x: CGFloat.random(in: 50...350), y: CGFloat.random(in: 50...350))
            }
            
            nodes.append(Node(name: name, position: position))
        }
        
        var edges = [Edge]()
        for i in 0..<nodeCount {
            let fromNode = nodes[i]
            for j in i+1..<nodeCount {
                let toNode = nodes[j]
                if Bool.random() && edges.count < nodeCount * 2 {
                    edges.append(Edge(from: fromNode, to: toNode))
                } else if edges.count < nodeCount * 2 {
                    edges.append(Edge(from: toNode, to: fromNode))
                }
            }
        }
        
        self.nodes = nodes
        self.edges = edges
    }
    
    func bfsTraversalOrder() -> [Node] {
        guard !nodes.isEmpty else { return [] }
        
        var visited = Set<Node>()
        var queue = [nodes[0]]
        var order = [nodes[0]]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            visited.insert(node)
            let adjacentNodes = edges
                .filter { $0.from == node }
                .map { $0.to }
                .filter { !visited.contains($0) }
            queue.append(contentsOf: adjacentNodes)
            order.append(contentsOf: adjacentNodes)
        }
        
        return order
    }
}
