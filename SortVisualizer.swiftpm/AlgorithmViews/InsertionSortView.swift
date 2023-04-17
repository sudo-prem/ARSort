import SwiftUI

struct InsertionSortView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Time complexity:\t\tO(n^2)")
                Text("Space complexity:\t\tO(1)")
                Text("K-passes:\t\t\t\tYes")
                Text("Stability:\t\t\t\tStable")
                Text("Adaptability:\t\t\tAdaptive")
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding()
            
            HStack {
                NSquareChart(title: "Input Size vs Time")
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
