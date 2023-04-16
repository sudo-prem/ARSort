import SwiftUI
import Charts

struct NLogNChart: View {
    
    private let chartData = ChartData.NLogNChartData
    
    var body: some View {
        VStack {
            GroupBox("Time Complexity") {
                Chart(chartData) { point in  
                    LineMark(
                        x: .value("Size", point.size),
                        y: .value("Time", point.time)
                    )
                    .interpolationMethod(.cardinal)
                }
                .padding(.horizontal, 16)
                .chartXAxisLabel("Size")
                .chartYAxisLabel("Time")
                .chartYScale(domain: [0, 100])
                .chartXScale(domain: [0, 30])
            }
        }
        .navigationTitle("Line Chart")
    }
}
