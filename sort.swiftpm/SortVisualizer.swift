import SwiftUI

struct SortVisualiser: View {
    @State var data = Array(1...28).shuffled()
    @State var selectedAlgorithm = "Insertion Sort"
    @State var isAnimating = false
    @State var isSortingComplete = false
    
    let sortingAlgorithms = ["Insertion Sort", "Bubble Sort", "Selection Sort"]
    
    var isDataSorted: Bool {
        for i in 0..<data.count-1 {
            if data[i] > data[i+1] {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        VStack {
            
            BarGraphView(data: data, maxValue: 100)
            
            Picker(selection: $selectedAlgorithm, label: Text("Sorting Algorithm")) {
                ForEach(sortingAlgorithms, id: \.self) { algorithm in
                    Text(algorithm).tag(algorithm)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .opacity(isSortingComplete || isAnimating ? 0 : 1)
            .animation(.easeInOut(duration: 0.35))
            
            HStack(spacing: 20) {
                
                if isAnimating {
                    
                    Spacer() 
                    
                    Button(action: {
                        isAnimating = false
                    }, label: {
                        Image(systemName: "pause.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
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
                    }
                    
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
        default:
            break
        }
    }
}
