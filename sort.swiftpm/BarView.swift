import SwiftUI

struct BarView: View {
    let value: Int
    
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .fill(Color.blue)
                .frame(width: 20, height: CGFloat(value) * 4)
                .id(value)
        }
    }
}
