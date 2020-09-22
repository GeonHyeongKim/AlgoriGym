//
//  보너스 점수.swift
//  Question Link: https://www.acmicpc.net/problem/17389
//  Primary idea:       (Simulation)
//                      1. 전체 점수(score)와 보너스 점수(bonus)를 변수로 선언한다.
//                      2. 반복문을 통해 "O","X"일 경우를 나누어
//                          i) "O"일경우, 전체 점수에 (i+1)과 보너스 점수(bonus)를 누적한다
//                          ii) "X"일경우, bonus를 0으로 초기화한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/22.
//

import Foundation
