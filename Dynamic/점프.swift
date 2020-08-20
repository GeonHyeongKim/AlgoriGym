//
//  점프.swift
//  Question Link: https://www.acmicpc.net/problem/1890
//  Primary idea:       (Dynamic Programming)
//                      1. 2차원 배열을 사용하여 DP를 만든다. dp[i][j] 배열의 값의 의미는 (i,j)까지 올때까지 걸린 갯수를 말한다.
//                      2. dp값이 0일 경우와 size를 넘길경우 continue
//                      3. 값의 변경은 해당값이 size보다 작을 경우 누적값으로 저장해놓는다.
//                      4. 정답은 dp[size-1][size-1]에 저장되게 된다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/20.
//

import Foundation
