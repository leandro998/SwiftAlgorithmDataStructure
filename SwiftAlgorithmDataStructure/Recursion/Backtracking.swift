//
//  Backtracking.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-06-26.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

// Exaustive search review:
func rollDice(_ n: Int) {
    var choices = [Int]()
    rollDiceHelper(n, choices: &choices)

}

func rollDiceHelper(_ n: Int, choices: inout [Int]) {
    if (n == 0) {
        print(choices)
    } else {
        for i in 1...6 {
            choices.append(i)
            rollDiceHelper(n - 1, choices: &choices)
            choices.removeLast()
        }
    }
}

// rollDice with sum:
func rollDiceSum(n: Int, sum: Int) {
    var choices = [Int]()
    rollDiceSumHelper(n: n, choices: &choices, sum: sum)

}

func rollDiceSumHelper(n: Int, choices: inout [Int], sum: Int) {
    if (n == 0) {
        print(choices)
    } else {
        for i in 1...6 {
            choices.append(i)
            rollDiceSumHelper(n: n - 1, choices: &choices, sum: sum)
            choices.removeLast()
        }
    }
}
