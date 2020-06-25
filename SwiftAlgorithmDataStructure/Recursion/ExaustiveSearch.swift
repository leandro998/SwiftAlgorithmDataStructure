//
//  ExaustiveSearch.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-06-24.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

// print all binary digits with n digits
func printBinaryExaustive(_ n: Int, _ prefix: String = "") {
    if (n == 0) {
        print(prefix)
    } else {
//        we have more decisions to make: choose 0 or 1 and exaustivly search
//        using for loop:
//        for i in 0..<2 {
//            printBinaryExaustive(n - 1, prefix + "\(i)")
//        }
        
//        using recursive:
        printBinaryExaustive(n - 1, prefix + "0")
        printBinaryExaustive(n - 1, prefix + "1")
        
    }
}

func printDecimal(_ n: Int, _ prefix: String = "") {
    if (n == 0) {
        print(prefix)
    } else {
        for i in 0...9 {
            printDecimal(n - 1, prefix + "\(i)")
        }
    }
}

//first try (repeating letters):

//func permutation(_ word: String, _ newWord: String = "") {
//    if (newWord.count == word.count) {
//        print(newWord)
//    } else {
//        for i in word {
//            permutation(word, newWord + "\(i)")
//        }
//    }
//}

func permutation(_ word: String, _ newWord: String = "") {
    if word.count == 0 {
        print(newWord)
    } else {
        for i in 0..<word.count {
            let c = word[i]
            permutation(word[0,i] + word[i+1,word.count], newWord + "\(c)")
        }
    }
}
