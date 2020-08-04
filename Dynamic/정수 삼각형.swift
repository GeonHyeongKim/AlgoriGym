//
//  정수 삼각형.swift
//  Question Link: https://www.acmicpc.net/problem/1932
//  Primary idea:       (DP)
//                      1. DP 2차원 문제
//                      2. dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + arr[i][j]
//                         이떄, j(열의 범위)가 j > 0 이여야한다. 이를 방지하기 위해 최대 배열의 값을 501로 한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/04.
//

import Foundation
