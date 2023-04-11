import SwiftUI

struct SortingVisualizer: View {
    @State var array: [Int] = [7, 4, 8, 2, 9, 1, 6, 5, 3]
    @State var sorting = false
    @State var sorted = false
    let sortingAlgorithms = SortingAlgorithms.self
    
    var body: some View {
        VStack {
            HStack {
                ForEach(array, id: \.self) { value in
                    BarView(value: value)
                }
            }
            .padding()
            
            Button(action: {
                self.sorting = true
                self.sorted = false
                self.startSorting()
            }) {
                Text("Sort")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .disabled(sorting)
        }
    }
    
    func startSorting() {
        var sortedArray: [Int] = []
        
        // Select sorting algorithm based on button pressed
        // Example here is using Bubble sort
        sortedArray = sortingAlgorithms.quickSort(array)
        
        // Animate sorting process
        var i = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.35, repeats: true) { timer in
            if i < sortedArray.count {
                let currentValue = sortedArray[i]
                let currentIndex = array.firstIndex(of: currentValue)!
                let sortedIndex = sortedArray.firstIndex(of: currentValue)!
                
                if currentIndex != sortedIndex {
                    withAnimation {
                        array.swapAt(currentIndex, sortedIndex)
                    }
                }
                
                i += 1
            } else {
                timer.invalidate()
                self.sorting = false
                self.sorted = true
            }
        }
    }
}
