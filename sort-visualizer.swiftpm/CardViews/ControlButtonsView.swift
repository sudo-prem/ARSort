import SwiftUI

struct ControlButtonsView: View {
    var body: some View {
        HStack(spacing: 21) {
           
            VStack(spacing: 5) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.pink)
                Text("Start Animation")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
            }
            
            VStack(spacing: 5) {
                Image(systemName: "pause.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.pink)
                Text("Pause Animation")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
            }
            
            VStack(spacing: 5) {
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.pink)
                Text("Learn Algorithm")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
            }
            
            VStack(spacing: 5) {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.pink)
                Text("Randomize Bars")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
            }
        }
    }
}
