//
//  체스판 다시 칠하기.swift
//  Question Link: https://www.acmicpc.net/problem/1018
//  Primary idea:       <Simulation & Brute force>
//                      1. 전체 체스판에서 8*8 크기의 체스판을 1칸씩 이동시키며 바꿔야하는 정사각형의 수를 확인
//                      2. 행+열의 값에 따라 경우의 수를 나누어,
//                          i) 흰색이라면 검은색으로 바꿔야 하는 수를 증가
//                          ii) 검은색이라면 흰색으로 바꿔야 하는 수를 증가
//                      3. 8*8 크기 동안 2번의 규칙에 따라 수를 증가시키고 가장 작은 값을 기억해 놓는다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/05.
//

import Foundation
