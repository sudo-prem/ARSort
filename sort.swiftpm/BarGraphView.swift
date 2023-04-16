import SwiftUI

struct BarGraphView: View {
    let data: [Int]
    let maxValue: Int
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(data, id: \.self) { value in
                BarView(value: value, maxValue: maxValue, barColor: .blue)
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
            let height = CGFloat(value) / CGFloat(maxValue) * geometry.size.height
            
            RoundedRectangle(cornerRadius: 5)
                .fill(barColor)
                .frame(width: geometry.size.width / 2, height: height)
                .animation(.easeInOut)
        }
    }
}


