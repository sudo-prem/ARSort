import SwiftUI

struct MergeSortView: View {
    var body: some View {
        HStack {
            
            NLogNChart(title: "Time vs Input Size", x: "Size", y: "Time")
                .frame(maxWidth: 210, minHeight: 210, maxHeight: 210)
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Time complexity\tO(n log n)")
                Text("Space complexity\tO(n)")
                Text("K-Passes\t\t\tNo")
                Text("Stability\t\t\tStable")
                Text("Adaptability\t\tNot adaptive")
            }
            .padding()
            .frame(minHeight: 210, maxHeight: 210)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding()
            
            NChart(title: "Memory vs Input Size", x: "Size", y: "Memory")
                .frame(maxWidth: 210, minHeight: 210, maxHeight: 210)
                .padding()
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}
