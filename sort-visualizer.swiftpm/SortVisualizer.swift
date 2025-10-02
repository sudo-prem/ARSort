import SwiftUI

struct SortVisualizer: View {
    @State var data = Array(1...28).shuffled()
    @State var selectedAlgorithm = "Merge Sort"
    @State var isAnimating = false
    @State var isSortingComplete = false
    @State var isInfoPresented = false
    
    let sortingAlgorithms = ["Bubble Sort", "Heap Sort", "Merge Sort", "Insertion Sort", "Selection Sort"]
    
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
                
                if isInfoPresented {
                    Button(action: {
                        SoundManager.instance.playSound(sound: .button)
                    }) {}
                        .frame(height: 0)
                        .sheet(isPresented: $isInfoPresented, content: {
                            HStack {
                                Spacer()
                                Button(action: { 
                                    isInfoPresented.toggle() 
                                    SoundManager.instance.playSound(sound: .button)
                                }) {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.pink)
                                        .font(.title2)
                                        .padding()
                                }
                            }
                            .padding(.trailing)
                            .padding(.top)
                            
                            InfoCardView(selectedAlgorithm: selectedAlgorithm)
                        })
                }
                
                VStack {
                    BarGraphView(data: data, maxValue: 100)
                    
                    Spacer()
                    
                    if selectedAlgorithm == "Insertion Sort" {
                        InsertionSortView()
                    } else if selectedAlgorithm == "Bubble Sort" {
                        BubbleSortView()
                    } else if selectedAlgorithm == "Selection Sort" {
                        SelectionSortView()
                    } else if selectedAlgorithm == "Merge Sort" {
                        MergeSortView()
                    } else if selectedAlgorithm == "Heap Sort" {
                        HeapSortView()
                    }
                    
                    Spacer()
                    
                    Picker(selection: $selectedAlgorithm, label: Text("Sorting Algorithm")) {
                        withAnimation(.easeInOut(duration: 0.35)) {
                            ForEach(sortingAlgorithms, id: \.self) { algorithm in
                                Text(algorithm).tag(algorithm)
                            }
                        }
                    }
                    .pickerStyle(.wheel)
                    .opacity(isSortingComplete || isAnimating ? 0 : 1)
                    
                    Spacer()

                    VStack (spacing: 100) {
                        
                        HStack(spacing: 100) {
                            
                            if isAnimating {
                                
                                Button(action: {
                                    withAnimation(.easeInOut(duration: 0.35)) {
                                        isAnimating = false
                                        SoundManager.instance.playSound(sound: .button)
                                    }
                                }, label: {
                                    Image(systemName: "pause.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.pink)
                                        .disabled(isSortingComplete)
                                })
                                .transition(.opacity)
                                
                            } else {
                                
                                Button(action: {
                                    withAnimation(.easeInOut(duration: 0.35)) {
                                        isInfoPresented = true
                                        SoundManager.instance.playSound(sound: .button)
                                    }
                                }, label: {
                                    Image(systemName: "info.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                })
                                .transition(.opacity)
                                .foregroundColor(.pink)
                                .disabled(isSortingComplete || isAnimating)
                                
                                if !isDataSorted {
                                    Button(action: {
                                        withAnimation(.easeInOut(duration: 0.35)) {
                                            isAnimating = true
                                            SoundManager.instance.playSound(sound: .button)
                                            startAnimation()   
                                        }
                                    }, label: {
                                        Image(systemName: "play.circle.fill")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .disabled(isSortingComplete)
                                    })
                                    .transition(.opacity)
                                    .foregroundColor(.pink)
                                }

                                Button(action: {
                                    withAnimation(.easeInOut(duration: 0.35)) {
                                        data = Array(1...28).shuffled()
                                        isAnimating = false
                                        isSortingComplete = false
                                        SoundManager.instance.playSound(sound: .button)
                                    }
                                }, label: {
                                    Image(systemName: "arrow.clockwise.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                })
                                .opacity(isAnimating ? 0 : 1)
                                .foregroundColor(.pink)
                                .disabled(isAnimating)
                                .onAppear {
                                    if isSortingComplete {
                                        isSortingComplete = false
                                    }
                                }
                            }
                        }
                        .padding(.vertical)
                    }
                    
                    Spacer()
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
}
