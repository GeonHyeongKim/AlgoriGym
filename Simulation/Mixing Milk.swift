//
//  Mixing Milk.swift
//  Question Link: https://www.acmicpc.net/problem/16769
//  Primary idea:       (Simulation)
//                      1. 3개의 입력을 받은 후, 수용력(capacity)배열과 우유의 양(amount) 배열을 각각 생성해서 관리한다 - 가독성 측면
//                      2. 100번 반복하는 과정에서 index를 계산하기 위해 3의 나머지를 계산한다.
//                      3. 우유를 옮기기 전의 양을 임시로 저장(temp)
//                      4. 옮기고 남아 있는 우유는 max(현재 우유 - (다음 우유 수용력 - 다음 우유의 양), 0)
//                      5. 다음 우유의 양은 min(다음 우유의 수용력, (이전의 우유의 양 + 다음 우유가 가지고 있는 현재의 양)
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/24.
//

import Foundation
