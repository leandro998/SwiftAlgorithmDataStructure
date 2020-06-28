//
//  main.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-06-23.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

//print(power(base: 3, exponent: 4))
//print(isPalindrome("madame"))
//printBinary(7)
//printDecimal(2)
//permutation("park")
//reverseLines(0)
//print(evaluate("((2+3)*(2+2))"))
//print(getDocumentsDirectory())
//rollDice(3)



//Mini Project -> TreeFiles:
//fileExistsTest()
//fileExistsTest(atPath: "/Users/leandro998/Documents", isDirectory: nil)

numbers = fileSystemCrawler(at: URL(fileURLWithPath: FileManager.default.currentDirectoryPath), 0, "\t├─", &nFiles, &nFolders)
print("\n\(numbers[0] - 1) directories, \(numbers[1]) files\n")
