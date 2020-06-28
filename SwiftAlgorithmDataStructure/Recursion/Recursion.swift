//
//  Recursion.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-06-23.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

func a() -> String {
    return "Hello"
}

// 1. power(base, exponent):

func power(base: Int, exponent: Int) -> Int {
    assert(exponent >= 0)
    if (exponent == 0) { return 1 } //base case
    return base * power(base: base, exponent: exponent - 1)
}

// 2. isPalindrome same word front-back and back-front

func isPalindrome(_ word: String) -> Bool {
    if (word.count <= 1) { return true }
    if let first = word.first, let last = word.last, first == last {
        return isPalindrome(word[1, word.count - 1])
    }
    return false
}

// 3.

func printBinary(_ number: Int) {
    if (number <= 1) {
        print(number, terminator: "")
        return
    }
    printBinary(number / 2)
    print(number % 2, terminator: "")
    
}

// 4. reverseLines
// - Print all lines in reverse order (recursively) from a text file
// - You can change the function header if you want
func reverseLines(_ line: Int) {
  let contents = try! String(contentsOfFile: "/Users/leandro998/Documents/GitHub.noSync/iOS-Guided-Projects/SwiftAlgorithmDataStructure/SwiftAlgorithmDataStructure/Recursion/story.txt")
  let sentences = contents.split(separator: "\n")
  // MARK: - YOUR RECURSIVE CODE GOES HERE...
    if (line < sentences.count) {
        reverseLines(line + 1)
        print(sentences[line])
    }
}

