//
//  String+DPStringTool.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-24.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

extension String {
    subscript(index: Int) -> String {
        get {
            return String(self[self.index(startIndex, offsetBy: index)])
        }
        set {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            self = self.replacingCharacters(in: startIndex..<self.index(after: startIndex), with: newValue)
        }
    }
    
    subscript(start: Int, end: Int) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: start)
            let endIndex = self.index(self.startIndex, offsetBy: end)
            return String(self[startIndex..<endIndex])
        }
        set {
            let startIndex = self.index(self.startIndex, offsetBy: start)
            let endIndex = self.index(self.startIndex, offsetBy: end)
            self = self.replacingCharacters(in: startIndex..<endIndex, with: newValue)
        }
    }
}
