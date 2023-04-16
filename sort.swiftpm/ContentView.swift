import SwiftUI

struct ContentView: View {
    @State var data = Array(0...20).shuffled()
    @State var selectedAlgorithm = "Insertion Sort"
    @State var isPaused = true
    
    var body: some View {
        VStack {
            Spacer()
            BarGraphView(data: data, maxValue: 100)
                .padding(.horizontal)
            
            HStack(spacing: 20) {
                Button(action: {
                    isPaused.toggle()
                    if !isPaused {
                        startAnimation()
                    }
                }, label: {
                    Image(systemName: isPaused ? "play.circle.fill" : "pause.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                })
                
                Button(action: {
                    data = Array(0...20).shuffled()
                    isPaused = true
                }, label: {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                })
            }
            .padding(.vertical)
            
            Picker(selection: $selectedAlgorithm, label: Text("Sorting Algorithm")) {
                Text("Insertion Sort").tag("Insertion Sort")
                Text("Bubble Sort").tag("Bubble Sort")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
    
    func startAnimation() {
        switch selectedAlgorithm {
        case "Insertion Sort":
            for i in 1..<data.count {
                var j = i
                while j > 0 && data[j - 1] > data[j] {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        data.swapAt(j, j - 1)
                    }
                    j -= 1
                }
            }
        case "Bubble Sort":
            var isSwapped = false
            repeat {
                isSwapped = false
                for i in 1..<data.count {
                    if data[i - 1] > data[i] {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            data.swapAt(i - 1, i)
                        }
                        isSwapped = true
                    }
                }
            } while isSwapped
        default:
            break
        }
        isPaused = true
    }
}
