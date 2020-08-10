//
//  MakeOne.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Derrick Park on 8/7/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// 2. Make One (DP Assignment)
/// - Parameter n: the given integer
/// - Returns: the minimum number of operations used to make 1
func makeOne(_ n: Int) -> Int {
  var dp = [Int](repeating: 0, count: n + 1)
  dp[1] = 0
  for i in 2...n {
    dp[i] = dp[i - 1] + 1
    if i % 2 == 0 && dp[i] > dp[i / 2] + 1 {
      dp[i] = dp[i / 2] + 1
    }
    if i % 3 == 0 && dp[i] > dp[i / 3] + 1 {
      dp[i] = dp[i / 3] + 1
    }
  }
  return dp[n]
}
