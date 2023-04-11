import SwiftUI

struct SortVisualizerView: View {
    @StateObject private var viewModel = SortVisualizerViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    viewModel.refresh()
                }, label: {
                    Image(systemName: "arrow.triangle.2.circlepath")
                })
                .font(.title)
                .padding()
                
                Spacer()
                
                Button(action: {
                    viewModel.toggleSort()
                }, label: {
                    Image(systemName: viewModel.sorting ? "pause.circle" : "play.circle")
                })
                .font(.title)
                .padding()
            }
            
            HStack {
                ForEach(viewModel.values, id: \.self) { value in
                    BarView(value: value)
                }
            }
        }
        .animation(viewModel.sorting ? .easeInOut(duration: 0.5) : nil)
    }
}
