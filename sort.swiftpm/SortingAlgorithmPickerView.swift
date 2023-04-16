import SwiftUI

struct SortingAlgorithmPickerView: View {
    @Binding var selectedAlgorithm: String
    
    let sortingAlgorithms = ["Insertion Sort", "Bubble Sort"]
    
    var body: some View {
        Picker("Select a sorting algorithm", selection: $selectedAlgorithm) {
            ForEach(sortingAlgorithms, id: \.self) {
                Text($0)
            }
        }
    }
}
