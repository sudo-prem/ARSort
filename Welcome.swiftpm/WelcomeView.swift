import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack() {
            PopupCardView()
            
            VStack {
                
                Text("Hello,")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("I'm Premnaath")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                
                Button(action: {
                    // handle button tap
                }) {
                    Text("Start Learning")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
