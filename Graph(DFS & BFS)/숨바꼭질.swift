//
//  숨바꼭질.swift
//  Question Link: https://www.acmicpc.net/problem/1697
//  Primary idea:       (BFS)
//                      1. BFS를 통해 한 점 x에서 x-1, x+1, x*2로 나아간다.
//                      2. 한번 퍼져나갈 때 1초가 걸리므로 동시에 이를 나타내는 A배열 값을 + 1씩 해준다
//                      3. visited배열과 A배열의 런타임에러가 발생하지 않도록 점의 범위인 ( 0<= N <= 100,000)에 들어오는지도 if조건문으로 확인
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/09.
//

import Foundation
