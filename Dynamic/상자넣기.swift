//
//  상자넣기.swift
//  Question Link: https://www.acmicpc.net/problem/1965
//  Primary idea:       (DP)
//                      1. LIS에 대한 개념
//                      2. 자기보다 이전의 원소들 중 작은 원소들을 하나씩 모두 비교
//                      3. 선택한 작은 원소의 최댓값 + 1을 한 값이, 현재 자기자신의 최댓값 보다 크다면 그 값으로 자기자신의 값을 갱신
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/24.
//

import Foundation
