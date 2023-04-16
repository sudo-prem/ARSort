import SwiftUI

struct BarGraphView: View {
    let data: [Int]
    let maxValue: Int
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(data, id: \.self) { value in
                BarView(value: value, maxValue: maxValue)
            }
        }
    }
}

struct BarView: View {
    let value: Int
    let maxValue: Int
    
    var body: some View {
        VStack {
            Spacer()
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 20, height: CGFloat(value) * 150 / CGFloat(maxValue))
            }
        }
    }
}

