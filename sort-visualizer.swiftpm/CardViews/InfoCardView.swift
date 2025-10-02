import SwiftUI

struct InfoCardView: View {
    let selectedAlgorithm: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Group {
                    Text("🎓 Hey Learner!")
                        .font(.largeTitle)
                        .bold()
                    
                    if selectedAlgorithm == "Insertion Sort" {
                        Text("Insertion Sort ✅")
                            .font(.title)
                            .bold()
                        Text("Insertion sort works by iterating through the array and inserting each element into its correct position. The algorithm maintains a sorted subarray at the beginning of the input array and gradually expands this subarray by inserting each new element in the correct position. Insertion sort has a worst-case time complexity of O(n^2), but is often faster than more complex algorithms for small input sizes.")
                    } else if selectedAlgorithm == "Bubble Sort" {
                        Text("Bubble Sort ✅")
                            .font(.title)
                            .bold()
                        Text("Bubble sort repeatedly steps through the list, compares adjacent elements and swaps them if they are in the wrong order. The algorithm passes through the list until no swaps are needed, which indicates that the list is sorted. Bubble sort has a worst-case time complexity of O(n^2), making it inefficient for large input sizes.")
                    } else if selectedAlgorithm == "Selection Sort" {
                        Text("Selection Sort ✅")
                            .font(.title)
                            .bold()
                        Text("Selection sort works by repeatedly finding the minimum element from the unsorted part of the array and moving it to the beginning. The algorithm maintains two subarrays, one sorted and one unsorted, and gradually expands the sorted subarray by selecting the smallest element from the unsorted subarray and swapping it with the first element of the unsorted subarray. Selection sort has a worst-case time complexity of O(n^2), making it inefficient for large input sizes.")
                    } else if selectedAlgorithm == "Merge Sort" {
                        Text("Merge Sort ✅")
                            .font(.title)
                            .bold()
                        Text("Merge sort is a divide-and-conquer sorting algorithm that works by recursively dividing the input array into two halves, sorting each half, and merging the two sorted halves back into a single sorted array. The algorithm divides the array in half until each subarray contains only one element, and then merges the subarrays by repeatedly selecting the smallest element from the two subarrays and appending it to the output array. Merge sort has a worst-case time complexity of O(n log n), making it efficient for large input sizes.")
                    } else if selectedAlgorithm == "Heap Sort" {
                        Text("Heap Sort ✅")
                            .font(.title)
                            .bold()
                        Text("Heap sort is a comparison-based sorting algorithm that works by building a binary heap from the input array, and repeatedly extracting the maximum element from the heap and inserting it into the output array. The algorithm builds a binary heap using a heap construction algorithm, such as bottom-up construction or top-down construction. Heap sort has a worst-case time complexity of O(n log n), making it efficient for large input sizes.")
                    } else {
                        Text("Invalid algorithm selected")
                    }
                    
                    Text("Time Complexity ⏱️")
                        .font(.title)
                        .bold()
                    Text("Time complexity is the amount of time required by an algorithm to complete its execution. It is usually measured in terms of the number of operations performed by the algorithm as a function of the size of the input data.")
                    
                    Text("Space Complexity 💾")
                        .font(.title)
                        .bold()
                    Text("Space complexity refers to the amount of memory required by an algorithm to complete its execution. It is usually measured in terms of the amount of memory used by the algorithm as a function of the size of the input data.")
                }
                Group {
                    Text("K-Passes ☄️")
                        .font(.title)
                        .bold()
                    Text("K-passes is the number of times an algorithm needs to process the input data in order to obtain the k largest or k smallest elements of the array. For example, if an algorithm requires k passes to obtain the k largest elements, it is said to have k-passes.")
                    
                    Text("Stability 🐎")
                        .font(.title)
                        .bold()
                    Text("Stability is the property of a sorting algorithm that ensures that the relative order of equal elements in the input data is preserved in the output data. A stable sorting algorithm will maintain the order of equal elements in the input data in the output data.")
                    
                    Text("Adaptability 🥂")
                        .font(.title)
                        .bold()
                    Text("Adaptability refers to the property of a sorting algorithm that allows it to efficiently handle input data that is already partially sorted. An adaptive sorting algorithm will take advantage of the existing order in the input data to reduce the number of comparisons and swaps needed to sort the data.")
                }
            }
        }
        .padding()
    }
}
