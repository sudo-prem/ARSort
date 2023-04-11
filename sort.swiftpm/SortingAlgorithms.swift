import SwiftUI

class SortingAlgorithms {
    
    // Bubble sort algorithm
    static func bubbleSort(_ array: [Int]) -> [Int] {
        var sortedArray = array
        let n = sortedArray.count
        
        for i in 0..<n {
            for j in 1..<n-i {
                if sortedArray[j] < sortedArray[j-1] {
                    sortedArray.swapAt(j, j-1)
                }
            }
        }
        
        return sortedArray
    }
    
    // Insertion sort algorithm
    static func insertionSort(_ array: [Int]) -> [Int] {
        var sortedArray = array
        
        for i in 1..<sortedArray.count {
            var j = i
            while j > 0 && sortedArray[j] < sortedArray[j-1] {
                sortedArray.swapAt(j, j-1)
                j -= 1
            }
        }
        
        return sortedArray
    }
    
    // Merge sort algorithm
    static func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        
        return merge(leftArray, rightArray)
    }
    
    private static func merge(_ leftArray: [Int], _ rightArray: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        var sortedArray = [Int]()
        
        while leftIndex < leftArray.count && rightIndex < rightArray.count {
            if leftArray[leftIndex] < rightArray[rightIndex] {
                sortedArray.append(leftArray[leftIndex])
                leftIndex += 1
            } else {
                sortedArray.append(rightArray[rightIndex])
                rightIndex += 1
            }
        }
        
        sortedArray.append(contentsOf: leftArray[leftIndex...])
        sortedArray.append(contentsOf: rightArray[rightIndex...])
        
        return sortedArray
    }
    
    // Quick sort algorithm
    static func quickSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        let pivot = array[array.count / 2]
        let less = array.filter { $0 < pivot }
        let equal = array.filter { $0 == pivot }
        let greater = array.filter { $0 > pivot }
        
        return quickSort(less) + equal + quickSort(greater)
    }
    
    // Count sort algorithm
    static func countSort(_ array: [Int], maxElement: Int) -> [Int] {
        var counts = Array(repeating: 0, count: maxElement+1)
        
        for element in array {
            counts[element] += 1
        }
        
        var sortedArray = [Int]()
        
        for (element, count) in counts.enumerated() {
            sortedArray += Array(repeating: element, count: count)
        }
        
        return sortedArray
    }
}
