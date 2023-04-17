import SwiftUI

struct SortVisualizer: View {
    @State var data = Array(1...28).shuffled()
    @State var selectedAlgorithm = "Insertion Sort"
    @State var isAnimating = false
    @State var isSortingComplete = false
    @State var isCardPresented = false
    
    let sortingAlgorithms = ["Bubble Sort", "Heap Sort", "Insertion Sort", "Merge Sort", "Quick Sort", "Selection Sort"]
    
    var isDataSorted: Bool {
        for i in 0..<data.count-1 {
            if data[i] != (i+1) {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack() {
                
                WelcomeCardView()
                
                if isCardPresented {
                    Button(action: {}) {}
                        .frame(height: 0)
                        .sheet(isPresented: $isCardPresented) {
                            ScrollView {
                                VStack(alignment: .leading, spacing: 20) {
                                    Group {
                                        Text("🎓")
                                            .font(.largeTitle)
                                            .bold()
                                        
                                        Text("Time Complexity")
                                            .font(.title)
                                            .bold()
                                        Text("Time complexity refers to the amount of time required by an algorithm to complete its execution. It is usually measured in terms of the number of operations performed by the algorithm as a function of the size of the input data.")
                                        
                                        Text("Space Complexity")
                                            .font(.title)
                                            .bold()
                                        Text("Space complexity refers to the amount of memory required by an algorithm to complete its execution. It is usually measured in terms of the amount of memory used by the algorithm as a function of the size of the input data.")
                                    }
                                    Group {
                                        Text("K-Passes")
                                            .font(.title)
                                            .bold()
                                        Text("K-passes refers to the number of times an algorithm needs to process the input data in order to obtain the k largest or k smallest elements of the array. For example, if an algorithm requires k passes to obtain the k largest elements, it is said to have k-passes.")
                                        
                                        Text("Stability")
                                            .font(.title)
                                            .bold()
                                        Text("Stability refers to the property of a sorting algorithm that ensures that the relative order of equal elements in the input data is preserved in the output data. A stable sorting algorithm will maintain the order of equal elements in the input data in the output data.")
                                        
                                        Text("Adaptability")
                                            .font(.title)
                                            .bold()
                                        Text("Adaptability refers to the property of a sorting algorithm that allows it to efficiently handle input data that is already partially sorted. An adaptive sorting algorithm will take advantage of the existing order in the input data to reduce the number of comparisons and swaps needed to sort the data.")
                                    }
                                    Spacer()
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Button(action: { isCardPresented.toggle() }) {
                                            Text("Close")
                                                .font(.title3)
                                                .foregroundColor(.pink)
                                        }
                                        .padding(10)
                                        .font(.system(size: 14))
                                        .hoverEffect(.highlight)
                                    }
                                }
                                .padding()
                            }
                        }
                }
                
                VStack {
                    
                    BarGraphView(data: data, maxValue: 100)
                        .frame(height: geo.size.height*0.39)
                        .padding(.bottom, calculatePadding(for: geo.size))
                    
                    Picker(selection: $selectedAlgorithm, label: Text("Sorting Algorithm")) {
                        ForEach(sortingAlgorithms, id: \.self) { algorithm in
                            Text(algorithm).tag(algorithm)
                        }
                    }
                    .pickerStyle(.wheel)
                    .opacity(isSortingComplete || isAnimating ? 0 : 1)
                    .animation(.easeInOut(duration: 0.35))
                    
                    if selectedAlgorithm == "Insertion Sort" {
                        InsertionSortView()
                    } else if selectedAlgorithm == "Bubble Sort" {
                        BubbleSortView()
                    } else if selectedAlgorithm == "Selection Sort" {
                        SelectionSortView()
                    } else if selectedAlgorithm == "Merge Sort" {
                        MergeSortView()
                    } else if selectedAlgorithm == "Quick Sort" {
                        QuickSortView()
                    } else if selectedAlgorithm == "Heap Sort" {
                        HeapSortView()
                    }

                    VStack (spacing: 100) {
                        HStack(spacing: 100) {
                            
                            if isAnimating {
                                
                                Spacer() 
                                
                                Button(action: {
                                    isAnimating = false
                                }, label: {
                                    Image(systemName: "pause.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.pink)
                                        .disabled(isSortingComplete)
                                        .animation(.easeInOut(duration: 0.35))
                                })
                                .transition(.opacity)
                                
                                Spacer()
                            } else {
                                
                                if !isDataSorted {
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        isAnimating = true
                                        startAnimation()   
                                    }, label: {
                                        Image(systemName: "play.circle.fill")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .disabled(isSortingComplete)
                                            .animation(.easeInOut(duration: 0.35))
                                    })
                                    .transition(.opacity)
                                    .foregroundColor(.pink)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    isCardPresented = true
                                }, label: {
                                    Image(systemName: "info.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                })
                                .transition(.opacity)
                                .foregroundColor(.pink)
                                .disabled(isSortingComplete || isAnimating)
                                .animation(.easeInOut(duration: 0.35))

                                Spacer()
                                
                                Button(action: {
                                    data = Array(1...28).shuffled()
                                    isAnimating = false
                                    isSortingComplete = false
                                }, label: {
                                    Image(systemName: "arrow.clockwise.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                })
                                .opacity(isAnimating ? 0 : 1)
                                .foregroundColor(.pink)
                                .disabled(isAnimating)
                                .animation(.easeInOut(duration: 0.35))
                                .onAppear {
                                    if isSortingComplete {
                                        isSortingComplete = false
                                    }
                                }
                                
                                Spacer()
                            }
                        }
                        .padding(.vertical)
                        .animation(.easeInOut(duration: 0.35))
                        
                        Spacer()
                    }
                }
            }
        }
    }
    
    func startAnimation() {
        switch selectedAlgorithm {
            
        case "Insertion Sort":
            DispatchQueue.global(qos: .userInteractive).async {
                for i in 1..<data.count {
                    var j = i
                    while j > 0 && data[j - 1] > data[j] {
                        DispatchQueue.main.async {
                            withAnimation(.easeInOut(duration: 0.21)) {
                                data.swapAt(j, j - 1)
                            }
                        }
                        Thread.sleep(forTimeInterval: 0.21)
                        if !isAnimating {
                            return
                        }
                        j -= 1
                    }
                }
                DispatchQueue.main.async {
                    isSortingComplete = true
                    isAnimating = false
                }
            }
            
        case "Bubble Sort":
            DispatchQueue.global(qos: .userInteractive).async {
                for i in 0..<data.count {
                    var swapped = false
                    for j in 1..<(data.count - i) {
                        DispatchQueue.main.async {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                if data[j - 1] > data[j] {
                                    data.swapAt(j, j - 1)
                                    swapped = true
                                }
                            }
                        }
                        Thread.sleep(forTimeInterval: 0.35)
                        if !isAnimating {
                            return
                        }
                    }
                    if !swapped {
                        break
                    }
                }
                DispatchQueue.main.async {
                    isSortingComplete = true
                    isAnimating = false
                }
            }
            
        case "Selection Sort":
            DispatchQueue.global(qos: .userInteractive).async {
                for i in 0..<(data.count - 1) {
                    var minIndex = i
                    for j in (i + 1)..<data.count {
                        if data[j] < data[minIndex] {
                            minIndex = j
                        }
                    }
                    DispatchQueue.main.async {
                        withAnimation(.easeInOut(duration: 0.50)) {
                            data.swapAt(i, minIndex)
                        }
                    }
                    Thread.sleep(forTimeInterval: 0.50)
                    if !isAnimating {
                        return
                    }
                }
                DispatchQueue.main.async {
                    isSortingComplete = true
                    isAnimating = false
                }
            }
            
        case "Merge Sort":
            DispatchQueue.global(qos: .userInteractive).async {
                var currentSize = 1
                while currentSize <= data.count - 1 {
                    var left = 0
                    while left < data.count - 1 {
                        let mid = left + currentSize - 1
                        let right = min(left + 2 * currentSize - 1, data.count - 1)
                        var i = left
                        var j = mid + 1
                        var temp: [Int] = []
                        while i <= mid && j <= right {
                            if data[i] < data[j] {
                                temp.append(data[i])
                                i += 1
                            } else {
                                temp.append(data[j])
                                j += 1
                            }
                        }
                        while i <= mid {
                            temp.append(data[i])
                            i += 1
                        }
                        while j <= right {
                            temp.append(data[j])
                            j += 1
                        }
                        DispatchQueue.main.async {
                            withAnimation(.easeInOut(duration: 0.21)) {
                                for index in left...right {
                                    data[index] = temp[index - left]
                                }
                            }
                        }
                        Thread.sleep(forTimeInterval: 0.21)
                        if !isAnimating {
                            return
                        }
                        left += 2 * currentSize
                    }
                    currentSize *= 2
                }
                DispatchQueue.main.async {
                    isSortingComplete = true
                    isAnimating = false
                }
            }
            
        case "Quick Sort":
            DispatchQueue.global(qos: .userInteractive).async {
                func quicksort(_ low: Int, _ high: Int) {
                    if low < high {
                        var i = low - 1
                        for j in low..<high {
                            if data[j] < data[high] {
                                i += 1
                                DispatchQueue.main.async {
                                    withAnimation(.easeInOut(duration: 0.35)) {
                                        data.swapAt(i, j)
                                    }
                                }
                                Thread.sleep(forTimeInterval: 0.35)
                                if !isAnimating {
                                    return
                                }
                            }
                        }
                        i += 1
                        DispatchQueue.main.async {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                data.swapAt(i, high)
                            }
                        }
                        Thread.sleep(forTimeInterval: 0.35)
                        if !isAnimating {
                            return
                        }
                        quicksort(low, i - 1)
                        quicksort(i + 1, high)
                    }
                }
                
                quicksort(0, data.count - 1)
                DispatchQueue.main.async {
                    isSortingComplete = true
                    isAnimating = false
                }
            }

        case "Heap Sort":
            DispatchQueue.global(qos: .userInteractive).async {
                func heapify(_ n: Int, _ i: Int) {
                    var largest = i
                    let left = 2 * i + 1
                    let right = 2 * i + 2
                    
                    if left < n && data[left] > data[largest] {
                        largest = left
                    }
                    
                    if right < n && data[right] > data[largest] {
                        largest = right
                    }
                    
                    if largest != i {
                        DispatchQueue.main.async {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                data.swapAt(i, largest)
                            }
                        }
                        Thread.sleep(forTimeInterval: 0.35)
                        if !isAnimating {
                            return
                        }
                        
                        heapify(n, largest)
                    }
                }
                
                func buildHeap(_ n: Int) {
                    for i in stride(from: n / 2 - 1, through: 0, by: -1) {
                        heapify(n, i)
                    }
                }
                
                for i in stride(from: data.count - 1, through: 1, by: -1) {
                    buildHeap(i + 1)
                    
                    DispatchQueue.main.async {
                        withAnimation(.easeInOut(duration: 0.35)) {
                            data.swapAt(0, i)
                        }
                    }
                    Thread.sleep(forTimeInterval: 0.35)
                    if !isAnimating {
                        return
                    }
                }
                
                DispatchQueue.main.async {
                    isSortingComplete = true
                    isAnimating = false
                }
            }
            
        default:
            break
        }
    }
    
    func calculatePadding(for size: CGSize) -> CGFloat {
        if size.height > 800 {
            return -240
        } else if size.height > 700 {
            return -180
        } else if size.height > 600 {
            return -120
        } else if size.height > 500 {
            return -60
        } else {
            return -30
        }
    }
}
