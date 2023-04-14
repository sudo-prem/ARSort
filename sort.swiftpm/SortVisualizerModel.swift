import SwiftUI

class SortVisualizerViewModel: ObservableObject {
    @Published var values: [Int] = []
    @Published var sorting: Bool = false
    
    private var timer: Timer?
    
    init() {
        refresh()
    }
    
    func refresh() {
        values = Array(1...10).shuffled()
        sorting = false
    }
    
    func toggleSort() {
        if sorting {
            timer?.invalidate()
        } else {
            startSort()
        }
        sorting.toggle()
    }
    
    private func startSort() {
        var index = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.35, repeats: true) { timer in
            if index >= self.values.count {
                timer.invalidate()
                self.sorting = false
                return
            }
            for j in stride(from: self.values.count-1, through: index+1, by: -1) {
                if self.values[j] < self.values[j-1] {
                    self.values.swapAt(j, j-1)
                }
            }
            index += 1
        }
    }
}
