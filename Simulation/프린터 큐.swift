//
//  프린터 큐.swift
//  Question Link: https://www.acmicpc.net/problem/1966
//  Primary idea:       (Simulation & Brute force & Queue)
//                      1. 큐에는 입력받는 인덱스, 중요도 총 2개의 데이터를 push 해줍니다.
//                      2. 우선순위 큐에는 중요도 총 1개의 데이터를 push 해줍니다.
//                      3. 우선순위 큐의 가장 위에 값과 같을 때 까지 큐를 계속 돌립니다.
//                         같아지면 우선순위 큐의 가장위를 pop하고 다시 반복합니다
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/05.
//

import Foundation
