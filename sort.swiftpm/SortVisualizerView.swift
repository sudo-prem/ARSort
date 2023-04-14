//import SwiftUI
//
//struct SortVisualizerView: View {
//    let sortingAlgorithms = [
//        "Bubble Sort",
//        "Insertion Sort",
//        "Merge Sort",
//        "Quick Sort",
//        "Count Sort"
//    ]
//    
//    @State private var sortAlgorithm = "Bubble Sort"
//    @State private var unsortedArray = [Int]()
//    @State private var sortedArray = [Int]()
//    @State private var isSorting = false
//    
//    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
//    
//    var body: some View {
//        VStack {
//            Picker("Sorting Algorithm", selection: $sortAlgorithm) {
//                ForEach(sortingAlgorithms, id: \.self) { algorithm in
//                    Text(algorithm)
//                }
//            }
//            .padding(.horizontal)
//            
//            HStack(spacing: 2) {
//                ForEach(sortedArray, id: \.self) { value in
//                    BarView(value: value)
//                }
//            }
//            .padding()
//            
//            Spacer()
//            
//            HStack {
//                Spacer()
//                Button(action: {
//                    self.isSorting.toggle()
//                }) {
//                    Image(systemName: isSorting ? "pause.fill" : "play.fill")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .clipShape(Circle())
//                }
//                .disabled(isSorting || sortedArray.isEmpty)
//                
//                Button(action: {
//                    self.generateUnsortedArray()
//                    self.sortedArray = []
//                }) {
//                    Image(systemName: "arrow.counterclockwise")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .clipShape(Circle())
//                }
//                .disabled(isSorting)
//                
//                Spacer()
//            }
//            .padding(.bottom, 16)
//        }
//        .onAppear {
//            self.generateUnsortedArray()
//        }
//        .onChange(of: sortAlgorithm) { _ in
//            self.sortedArray = SortingAlgorithms.sort(unsortedArray, by: sortAlgorithm)
//        }
//        .onReceive(timer) { _ in
//            if isSorting && !sortedArray.isSorted() {
//                self.sortedArray = SortingAlgorithms.nextStep(sortedArray, for: sortAlgorithm)
//            } else {
//                isSorting = false
//            }
//        }
//    }
//    
//    private func generateUnsortedArray() {
//        unsortedArray = Array(1...30).shuffled()
//    }
//}
//
//extension Array where Element: Comparable {
//    func isSorted() -> Bool {
//        for i in 1..<self.count {
//            if self[i] < self[i-1] {
//                return false
//            }
//        }
//        return true
//    }
//}
//
//struct SortVisualizerView_Previews: PreviewProvider {
//    static var previews: some View {
//        SortVisualizerView()
//    }
//}
