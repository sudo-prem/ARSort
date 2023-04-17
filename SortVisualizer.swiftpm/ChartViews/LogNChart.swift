import SwiftUI
import Charts

struct LogNChart: View {
    var title: String
    var x: String
    var y: String
    private let chartData = ChartData.LogNChartData
    
    var body: some View {
        VStack {
            GroupBox("\(title)") {
                Chart(chartData) { point in  
                    LineMark(
                        x: .value("Size", point.size),
                        y: .value("Time", point.time)
                    )
                    .interpolationMethod(.cardinal)
                    .foregroundStyle(.pink)
                }
                .padding(.horizontal, 16)
                .chartXAxisLabel("\(x)")
                .chartYAxisLabel("\(y)")
                .chartYScale(domain: [0, 100])
                .chartXScale(domain: [0, 30])
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
    }
}
