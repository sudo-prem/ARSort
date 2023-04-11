import SwiftUI

struct ContentView: View {
    @State private var values: [Int] = Array(Set((1...100).map { _ in Int.random(in: 1...100) }).prefix(21))
    @State private var isSorting = false
    @State private var algorithmIndex = 0
    @State private var currentIndex = -1
    
    private let algorithms = ["Bubble Sort", "Selection Sort", "Insertion Sort", "Merge Sort"]
    private let barCount = 21
    
    private var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if isSorting != false {
                switch self.algorithmIndex {
                case 0:
                    bubbleSort()
                case 1:
                    selectionSort()
                case 2:
                    insertionSort()
                case 3:
                    mergeSort()
                default:
                    break
                }
            }
        }
    }
    
    private func randomize() {
        values = Array(Set((1...100).map { _ in Int.random(in: 1...100) }).prefix(21))
        
        timer.invalidate()
        self.isSorting = false
        self.currentIndex = -1
    }
    
    private func bubbleSort() {
        if self.currentIndex == -1 {
            self.currentIndex = self.values.count - 1
        }
        if self.currentIndex == 0 {
            timer.invalidate()
            self.isSorting = false
            self.currentIndex = -1
        } else {
            for i in 0..<self.currentIndex {
                if self.values[i] > self.values[i+1] {
                    let temp = self.values[i]
                    self.values[i] = self.values[i+1]
                    self.values[i+1] = temp
                }
            }
            self.currentIndex -= 1
        }
    }
    
    private func selectionSort() {
        if self.currentIndex == -1 {
            self.currentIndex = 0
        }
        if self.currentIndex == self.values.count {
            timer.invalidate()
            self.isSorting = false
            self.currentIndex = -1
        } else {
            var minIndex = self.currentIndex
            for j in self.currentIndex+1..<self.values.count {
                if self.values[j] < self.values[minIndex] {
                    minIndex = j
                }
            }
            if minIndex != self.currentIndex {
                let temp = self.values[self.currentIndex]
                self.values[self.currentIndex] = self.values[minIndex]
                self.values[minIndex] = temp
            }
            self.currentIndex += 1
        }
    }
    
    private func insertionSort() {
        if self.currentIndex == -1 {
            self.currentIndex = 1
        }
        if self.currentIndex == self.values.count {
            timer.invalidate()
            self.isSorting = false
            self.currentIndex = -1
        } else {
            let current = self.values[self.currentIndex]
            var j = self.currentIndex - 1
            while j >= 0 && self.values[j] > current {
                self.values[j+1] = self.values[j]
                j -= 1
            }
            self.values[j+1] = current
            self.currentIndex += 1
        }
    }
    
    private func mergeSort() {
        // to implement
    }
    
    var body: some View {
        VStack {
            Spacer()
            Picker("Algorithm", selection: $algorithmIndex) {
                ForEach(0..<algorithms.count) {
                    Text(self.algorithms[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Spacer()
            HStack {
                ForEach(values, id: \.self) { value in
                    VStack {
                        Spacer()
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 20, height: CGFloat(value) * 4)
                            .id(value)
                    }
                }
            }
            .padding()
            
            
            Button(action: {
                self.randomize()
            }) {
                Text("Randomize")
                    .fontWeight(.semibold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 24)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
            .padding()
            
            Button(action: {
                self.isSorting = true
                self.timer.fire()
            }) {
                Text("Sort")
                    .fontWeight(.semibold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 24)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
            .padding()
        }
        .animation(.easeInOut(duration: 1))
        Spacer()
    }
}
