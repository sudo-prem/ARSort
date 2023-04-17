import SwiftUI

struct InsertionSortView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Time complexity\t\tO(n^2)")
                Text("Space complexity\t\tO(1)")
                Text("K-Passes\t\t\t\tYes")
                Text("Stability\t\t\t\tStable")
                Text("Adaptability\t\t\tAdaptive")
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding()
            .animation(.easeInOut(duration: 0.35))
            
            HStack {
                NSquareChart(title: "Time vs Input Size", x:"Size", y:"Time")
                    .frame(width: 210, height: 210)
                    .animation(.easeInOut(duration: 0.35))
                ConstantChart(title: "Memory vs Input Size", x: "Size", y: "Memory")
                    .frame(width: 210, height: 210)
                    .animation(.easeInOut(duration: 0.35))
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding()
        }
    }
}
