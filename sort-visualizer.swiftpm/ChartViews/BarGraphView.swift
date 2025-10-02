import SwiftUI

struct BarGraphView: View {
    let data: [Int]
    let maxValue: Int
    
    var body: some View {
        HStack(spacing: 0.5) {
            ForEach(data, id: \.self) { value in
                BarView(value: value, maxValue: maxValue, barColor: .pink)
                    .frame(maxHeight: 280)
            }
        }
    }
}

struct BarView: View {
    var value: Int
    var maxValue: Int
    var barColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            let height = CGFloat(value) / CGFloat(maxValue) * (geometry.size.height * 3.5)
            
            RoundedRectangle(cornerRadius: 5)
                .fill(barColor)
                .frame(width: geometry.size.width / 2, height: height)
        }
    }
}
