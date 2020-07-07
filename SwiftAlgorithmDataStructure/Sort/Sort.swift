//
//  Sort.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-06.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

//Bubble Sort:
// Time Complexity: O(n^2)
// Space Complexity: O(n)

func bubbleSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard arr.count > 1 else { return arr }
    
    var elements = arr
    for i in 0..<elements.count - 1 {
        for j in 1..<elements.count - i {
            if comparator(elements[j], elements[j - 1]) {
                //swap
                let temp = elements[j - 1]
                elements[j - 1] = elements[j]
                elements[j] = temp
            }
        }
    }
    return elements
}

// Selection Sort
// Time Complexity: O(n^2)
// Space Complexity: O(n)

func selectionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard arr.count > 1 else { return arr }
    
    var elements = arr
    for i in 0..<elements.count {
        var minIndex = i
        for j in i+1..<elements.count {
            if comparator(elements[j], elements[minIndex]) {
                minIndex = j
            }
        }
        if i != minIndex {
            elements.swapAt(minIndex, i)
        }
    }
    return elements
}

// Insertion Sort
// Time Complexity: O(n^2)
// Space Complexity: O(n)

func insertionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  var elements = arr
  for i in 1..<elements.count {
    var j = i
    let toInsert = elements[j]
    while j > 0 && comparator(toInsert, elements[j-1]) {
      // shift
      elements[j] = elements[j-1]
      j -= 1
    }
    elements[j] = toInsert
  }
  
  return elements
}

// Merge Sort
// Time Complexity: O(N lgN)
// Space Complexity: O(N)
func mergeSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  // O(lg N)
  let mid = arr.count / 2
  let sortedLeft = mergeSort(Array(arr[..<mid]), comparator)
  let sortedRight = mergeSort(Array(arr[mid...]), comparator)
  return merge(sortedLeft, sortedRight, comparator) // O(N)
}

// Time Complexity: O(N)
func merge<T: Comparable>(_ left: [T], _ right: [T], _ comparator: (T, T) -> Bool) -> [T] {
  var i = 0
  var j = 0
  var merged: [T] = []
  while true {
    guard i < left.count else {
      merged.append(contentsOf: right[j...])
      break
    }
    guard j < right.count else {
      merged.append(contentsOf: left[i...])
      break
    }
    if comparator(left[i], right[j]) {
      merged.append(left[i])
      i += 1
    } else {
      merged.append(right[j])
      j += 1
    }
  }
  
  return merged
}

// * Quick Sort (sorts in-place)
// Slow Quick Sort:
// Space Complexity: O(n) -> should be O(1)
func quickSortSlow<T: Comparable>(_ arr: [T]) -> [T] {
  if arr.count <= 1 { return arr }
  var elements = arr
  let pivot = elements.removeLast()
  let lessOrEqual = elements.filter { $0 <= pivot }
  let greater = elements.filter { $0 > pivot }
  return quickSortSlow(lessOrEqual) + [pivot] + quickSortSlow(greater)
}

//============ Quick Sort Assignment ============//
// * Quick Sort (sorts in-place)
// Time Complexity: O(N lgN) -> technically O(N^2) in the worst case
// Space Complexity: O(1)

//function to get better user input:
func quickSort<T: Comparable>(arr: inout [T]) {
    quickSort(&arr, 0, arr.count-1)
    print(arr)
}

//Quick Sort Main Function:
func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) {
    //base case:
    if start >= end { return }
    
    //define the index for the partition:
    let pivotIndex = partition(&arr, start, end)
    //recursive call back quickSort:
    quickSort(&arr, start, pivotIndex - 1)
    quickSort(&arr, pivotIndex + 1, end)
}

/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) -> Int {
    var pivotIndex = start
    for i in start..<end {
        if arr[i] < arr[end] {
            arr.swapAt(pivotIndex, i)
            pivotIndex += 1
        }
    }
    arr.swapAt(pivotIndex, end)
    return pivotIndex
}
