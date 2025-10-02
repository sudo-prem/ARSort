import SwiftUI

struct WelcomeCardView: View {
    @State private var isCardPresented = true
    
    public var body: some View {
        Button(action: {}) {}
            .frame(height: 0)
            .sheet(isPresented: $isCardPresented) {
                VStack(alignment: .center) {
                    Spacer()
                    
                    Image(systemName: "sparkles")
                        .font(.system(size: 77))
                        .foregroundColor(.pink)
                        .padding(30)
                    Text("Welcome!")
                        .font(.system(size: 35))
                        .foregroundColor(.pink)
                        .bold()
                        .padding(30)
                    HStack {
                        (
                            Text("This is an educational playground app, designed to help you learn ") + 
                            Text("Sorting Algorithms ").bold() + 
                            Text("through visualizations.")
                        )
                        .font(.system(size: 21))
                        .multilineTextAlignment(.center)
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding()
                    
                    Spacer()
                    
                    ControlButtonsView()
                    
                    Spacer()
                    
                    HStack {
                        Button(action: { 
                            isCardPresented.toggle()
                            SoundManager.instance.playSound(sound: .start)
                        }) {
                            Text("Get Started")
                                .font(.title2)
                                .foregroundColor(.pink)
                        }
                        .padding(10)
                        .font(.system(size: 14))
                        .hoverEffect(.highlight)
                    }
                }
                .padding(50)
            }
    }
}
