//
//  2xNTiles.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Derrick Park on 8/10/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// 3. 2 x N Tiles
/// - Parameter n: the width
/// - Returns: the number of ways to fill 2 x N tiles with 1 x 2 and 2 x 1
/// Time Complexity: O(N)
/// Space Complexity: O(N) -> O(1) two variables (Ref. Climbing Stairs)
func twoByNTiles(_ n: Int) -> Int {
  if n <= 2 { return n }
  
  var dp = [Int](repeating: 0, count: n + 1)
  dp[1] = 1
  dp[2] = 2
  for i in 3...n {
    dp[i] = dp[i - 1] + dp[i - 2]
  }
  return dp[n]
}
