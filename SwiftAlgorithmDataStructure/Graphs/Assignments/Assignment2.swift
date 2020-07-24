//
//  Assignment2.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-22.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//


import Foundation

func repeatingSequence(num: Int) {
//    let p = 2
    
    let digits = String(num)
    let number = digits.digits
    
    var sum = 0
    var seq = [Int]()
//    var result = [Int]()
//    var adj = [Int](repeating: 0, count: 1)
    
    if seq.count == 0 {
        seq.append(num)
    }
    
    for i in number {
        sum = sum + i * i
    }
    
    if seq.count < 20 {
        seq.append(sum)
        repeatingSequence(num: sum)
    } else {
        print(seq)
    }
}

extension StringProtocol  {
    var digits: [Int] { compactMap(\.wholeNumberValue) }
}

/*
 
class Permutations {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        var isVisited = [Bool](repeating: false, count: nums.count)
        
        dfs(&res, &path, &isVisited, nums)
        
        return res
    }
    
    private func dfs(_ res: inout [[Int]], _ path: inout [Int], _ isVisited: inout [Bool], _ nums: [Int]) {
        guard path.count != nums.count else {
            res.append(path)
            return
        }
        
        for (i, num) in nums.enumerated() where !isVisited[i] {
            path.append(num)
            isVisited[i] = true
            dfs(&res, &path, &isVisited, nums)
            isVisited[i] = false
            path.removeLast()
        }
    }
}

//  github.com/soapyigu/LeetCode-Swift/blob/master/DFS/PermutationsII.swift

class PermutationsII {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]](), path = [Int](), visited = [Bool](repeating: false, count: nums.count)
        
        let nums = nums.sorted(by: <)
        
        _dfs(&res, &path, nums, &visited)
        
        return res
    }
    
    private func _dfs(_ res: inout [[Int]], _ path: inout [Int], _ nums: [Int], _ visited: inout [Bool]) {
        // termination case
        if path.count == nums.count {
            res.append(path)
            return
        }
        
        for i in 0..<nums.count {
            if visited[i] || (i > 0 && nums[i] == nums[i - 1] && visited[i - 1]) {
                continue
            }
            
            path.append(nums[i])
            visited[i] = true
            _dfs(&res, &path, nums, &visited)
            visited[i] = false
            path.removeLast()
        }
    }
}
 
 */
