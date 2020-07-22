//
//  FindElements.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-15.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

//-----------------------------

func largestElements(size: Int) {
    var mLarge: [Int] = []
    
    while true {
        let elem = Int(readLine()!)! // N times
        
        if mLarge.count < size {
            mLarge.append(elem)
        } else {
            for i in 0..<size {
                if elem > mLarge[i] {
                    mLarge[i] = elem
                    break
                }
            }
        }
        print(mLarge)
    }
}

//-----------------------------

func A(m: Int) {
    var arr: [Int] =  []
    while true {
        let elem = Int(readLine()!)! // N times
        if arr.contains(elem){
            continue;
        }
        if arr.count < m {
            arr.append(elem)
            mergeSort(&arr,0,arr.count)
        }else if elem > arr[0]{
            arr[0] = elem
            mergeSort(&arr,0,arr.count)
        }
        if arr.count == m {
            print(arr)
        }
        // some way to store M smallest or largest elements
    }
    // print M smallest or largest elements
}



//--------------------------------------------

func largestElements(elements: [Int], size: Int) -> [Int] {
    var result: [Int] = []
    result.append(elements[0])
    for index in 1..<elements.count {
        if(result.count < size){
            result.append(elements[index])
            mergeSort(&result,0,result.count)
        }else if elements[index] > result[0] {
            result[0] = elements[index]
            mergeSort(&result,0,result.count)
        }
    }
    return result
}

func mergeSort(_ numbers: inout [Int], _ start: Int, _ end: Int){
    let size = (end - start)
    if (size > 1) {
        let middle = (start + end) / 2
        mergeSort(&numbers, start, middle)
        mergeSort(&numbers, middle, end)
        merge(&numbers, start, middle, end)
    }
    
}

fileprivate func merge(_ numbers: inout [Int],_ start: Int ,_ middle : Int,_ end: Int) -> [Int] {
    var position = 0
    var array1Position = start;
    var array2Position = middle;
    var newArray : [Int] = Array(repeating: -1, count: end - start)
    
    while array1Position < middle && array2Position <  end {
        let array1Value = numbers[array1Position]
        let array2Value = numbers[array2Position]
        if array1Value < array2Value {
            newArray[position] = array1Value
            array1Position += 1
        }else{
            newArray[position] = array2Value
            array2Position += 1
        }
        position += 1
    }
    
    while array1Position < middle {
        newArray[position] = numbers[array1Position]
        position += 1
        array1Position += 1
    }
    
    while array2Position < end {
        newArray[position] = numbers[array2Position]
        position += 1
        array2Position += 1
    }
    for i in 0..<position {
        numbers[start + i] = newArray[i]
    }
    return numbers
}
