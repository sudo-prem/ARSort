//import SwiftUI
//
//struct BarGraphView: View {
//    let data: [Int]
//    
//    var body: some View {
//        HStack(spacing: 5) {
//            ForEach(data, id: \.self) { value in
//                BarView(value: scaledValue(value))
//            }
//        }
//    }
//    
//    func scaledValue(_ value: Int) -> Int {
//        let minValue = data.min() ?? 0
//        let maxValue = data.max() ?? 100
//        let scaledValue = (value - minValue) * 100 / (maxValue - minValue)
//        return min(100, max(0, scaledValue))
//    }
//}
