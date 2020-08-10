//
//  ClimbingStairs.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Derrick Park on 8/7/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation


/// Leetcode 70 - Climbing Stairs
/// - Parameter n: the number of stairs
/// - Returns: distinct ways you can climb to the top, n.
/// Time Complexity: O(n)
/// Space Complexity: O(n)
func climbStairs(_ n: Int) -> Int {
  if n <= 2 { return n }
  
  var dp = [Int](repeating: 0, count: n + 1)
  dp[1] = 1
  dp[2] = 2
  for i in 3...n {
    dp[i] = dp[i - 1] + dp[i - 2]
  }
  return dp[n]
}

/// Time Complexity: O(n)
/// Space Complexity: O(1)
func climbStairsBetter(_ n: Int) -> Int {
  if n <= 2 { return n }
  
  var first = 1
  var second = 2
  for _ in 3...n {
    let third = first + second
    first = second
    second = third
  }
  return second
}
