//
//  Assignment1.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-06-24.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

func evaluate(_ calculate: String) {
    print(evaluateHelper(calculate))
}

func evaluateHelper(_ calculate: String, _ res: Int = 0) {
    if (calculate.count == 0) {
        print("count:\(calculate.count)/calc:\(calculate)/res:\(res)")
        print(res)
    } else {
        for i in 0..<calculate.count {
            let x = calculate[i]
            let isNumber = CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: x))
            var y = ""
            if (i == 0) {
                y = ""
            } else {
                y = calculate[i-1]
            }
            
            if (y == "+") {
                evaluateHelper(calculate[i+1, calculate.count], res + Int(x)!)
            } else if (y == "*") {
                evaluateHelper(calculate[i+1, calculate.count], res * Int(x)!)
            } else {
                if (isNumber) {
                    evaluateHelper(calculate[i+1, calculate.count], Int(x)!)
                } else if (!isNumber) {
                    evaluateHelper(calculate[i+1, calculate.count], res)
                }
            }
            
            
            
//            if (x == "+") {
//                print("count:\(calculate.count)/x:\(x)/calc:\(calculate)/res:\(res)")
//                evaluateHelper(calculate[i+1,calculate.count], res, "+")
//            } else if (x == "*") {
//                print("count:\(calculate.count)/x:\(x)/calc:\(calculate)/res:\(res)")
//                evaluateHelper(calculate[i+1,calculate.count], res, "*")
//            } else {
//                if (operation == "+") {
//                    print("count:\(calculate.count)/x:\(x)/calc:\(calculate)/res:\(res)")
//                    evaluateHelper(calculate[i+1,calculate.count], res + Int(x)!, "")
//                } else if (operation == "*") {
//                    print("count:\(calculate.count)/x:\(x)/calc:\(calculate)/res:\(res)")
//                    evaluateHelper(calculate[i+1,calculate.count], res * Int(x)!, "")
//                } else {
//                    print("count:\(calculate.count)/x:\(x)/calc:\(calculate)/res:\(res)")
//                    evaluateHelper(calculate[i+1,calculate.count], Int(x)!, "")
//                }
//            }
        }
    }
}

// evaluate("2+3")
