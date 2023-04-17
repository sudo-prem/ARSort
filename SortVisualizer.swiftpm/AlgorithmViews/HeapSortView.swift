import SwiftUI

struct HeapSortView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Time complexity:\t\tO(n log n)")
                Text("Space complexity:\t\tO(1)")
                Text("K-passes:\t\t\t\tNo")
                Text("Stability:\t\t\t\tNot stable")
                Text("Adaptability:\t\t\tNot adaptive")
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding()
            
            HStack {
                NLogNChart(title: "Input Size vs Time")
                    .frame(width: 210, height: 210)
                NSquareChart(title: "Input Size vs Space")
                    .frame(width: 210, height: 210)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding()
        }
        
    }
}
