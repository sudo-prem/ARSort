import SwiftUI

struct PopupCardView: View {
    @State private var isCardPresented = true
    
    public var body: some View {
        Button(action: {}) {}
            .frame(height: 0)
            .sheet(isPresented: $isCardPresented) {
                VStack(alignment: .center) {
                    Spacer()
                    Image(systemName: "sparkles")
                        .font(.system(size: 150))
                        .foregroundColor(.accentColor)
                        .padding(30)
                    Text("Welcome!")
                        .font(.system(size: 40))
                        .bold()
                        .padding(30)
                    (
                        Text("This is an educational playground app, designed to help you learn ") + 
                        Text("Sorting Algorithms ").bold() + 
                        Text("through visualizations.")
                    )
                    .font(.system(size: 21))
                    .multilineTextAlignment(.center)
                    Spacer()
                    HStack {
                        Button(action: { isCardPresented.toggle() }) {
                            Text("Get Started")
                                .font(.title)
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
