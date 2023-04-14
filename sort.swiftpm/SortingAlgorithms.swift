import SwiftUI
import SwiftUI

struct SortingView: View {
    @State private var selectedAlgorithm = SortingAlgorithm.bubbleSort
    @State private var sortedData: [Int] = []
    @State private var isSorting = false
    let data = [5, 2, 7, 9, 1, 4, 3, 8, 6]
    
    var body: some View {
        VStack {
            Picker(selection: $selectedAlgorithm, label: Text("Sorting Algorithm")) {
                ForEach(SortingAlgorithm.allCases, id: \.self) { algorithm in
                    Text(algorithm.rawValue).tag(algorithm)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            
            if sortedData.isEmpty {
                Text("Tap sort to display sorted data")
                    .font(.title)
            } else {
                BarGraphView(data: sortedData)
            }
            
            HStack {
                Button(action: {
                    self.sortedData = self.data.shuffled()
                }) {
                    Image(systemName: "arrow.counterclockwise")
                        .padding()
                        .font(.title)
                }
                .disabled(isSorting)
                
                Spacer()
                
                Button(action: {
                    self.isSorting.toggle()
                    self.sortData()
                }) {
                    Image(systemName: isSorting ? "pause" : "play")
                        .padding()
                        .font(.title)
                }
                .disabled(sortedData.isEmpty)
            }
            .padding()
        }
    }
    
    func sortData() {
        let sortedData = selectedAlgorithm.sort(data)
        var currentIndex = 0
        
        // Animate the sorting process
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            guard self.isSorting else {
                timer.invalidate()
                return
            }
            
            if currentIndex < sortedData.count {
                self.sortedData = Array(sortedData.prefix(currentIndex + 1))
                currentIndex += 1
            } else {
                timer.invalidate()
            }
        }
    }
}

struct BarGraphView: View {
    let data: [Int]
    
    var body: some View {
        HStack(spacing: 5) {
            ForEach(data, id: \.self) { value in
                BarView(value: scaledValue(value))
            }
        }
    }
    
    func scaledValue(_ value: Int) -> Int {
        let minValue = data.min() ?? 0
        let maxValue = data.max() ?? 100
        let scaledValue = (value - minValue) * 100 / (maxValue - minValue)
        return min(100, max(0, scaledValue))
    }
}

struct BarView: View {
    let value: Int
    
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .fill(Color.blue)
                .frame(width: 20, height: CGFloat(value))
        }
    }
}

enum SortingAlgorithm: String, CaseIterable, Identifiable {
    case bubbleSort = "Bubble Sort"
    case insertionSort = "Insertion Sort"
    case selectionSort = "Selection Sort"
    
    var id: String { self.rawValue }
    
    func sort(_ data: [Int]) -> [Int] {
        switch self {
        case .bubbleSort:
            return bubbleSort(data)
        case .insertionSort:
            return insertionSort(data)
        case .selectionSort:
            return selectionSort(data)
        }
    }
    
    private func bubbleSort(_ data: [Int]) -> [Int] {
        var result = data
        for i in 0..<result.count {
            for j in 1..<result.count-i {
                if result[j-1] > result[j] {
                    result.swapAt(j-1, j)
                }
            }
        }
        return result
    }
    
    private func insertionSort(_ data: [Int]) -> [Int] {
        var result = data
        for i in 1..<result.count {
            var j = i
            while j > 0 && result[j] < result[j-1] {
                result.swapAt(j, j-1)
                j -= 1
            }
        }
        return result
    }
    
    private func selectionSort(_ data: [Int]) -> [Int] {
        var result = data
        for i in 0..<result.count-1 {
            var minIndex = i
            for j in i+1..<result.count {
                if result[j] < result[minIndex] {
                    minIndex = j
                }
            }
            if minIndex != i {
                result.swapAt(i, minIndex)
            }
        }
        return result
    }
}
