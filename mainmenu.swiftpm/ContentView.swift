import SwiftUI

struct CardView: View {
    var cardNumber: Int
    @Binding var showDetail: Bool
    
    var body: some View {
        VStack {
            Text("Card \(cardNumber)")
                .font(.title)
                .padding()
            Button(action: {
                self.showDetail.toggle()
            }) {
                Text("Open Detail")
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var showDetail = false
    
    var body: some View {
        HStack {
            CardView(cardNumber: 1, showDetail: $showDetail)
            CardView(cardNumber: 2, showDetail: $showDetail)
        }
        .padding()
        .sheet(isPresented: $showDetail) {
            DetailView()
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .font(.title)
            .padding()
    }
}
