import SwiftUI
import Charts

struct NSquareChart: View {
    var title: String
    private let chartData = ChartData.NSquareChartData
    
    var body: some View {
        VStack {
            GroupBox("\(title)") {
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
                .chartXScale(domain: [0, 15])
            }
            .chartXAxis {
                AxisMarks {
                    AxisGridLine()
                    AxisTick()
                }
            }
            .chartYAxis {
                AxisMarks {
                    AxisGridLine()
                    AxisTick()
                }
            }
        }
        .navigationTitle("Line Chart")
    }
}
