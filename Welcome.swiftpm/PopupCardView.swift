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
                        Text("This educational playground app is designed to help you learn ") + 
                        Text("Sorting Algorithms, ").bold() + 
                        Text(" and ") + Text("Graph Traversal techniques").bold() +
                        Text(" through visualizations.")
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
