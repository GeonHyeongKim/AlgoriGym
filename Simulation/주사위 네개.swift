//
//  주사위 네개.swift
//  Question Link: https://www.acmicpc.net/problem/2484
//  Primary idea:       (Simulation & Math & 사칙연산)
//                      1. 주사위 세개와 비슷하게 풀이
//                      2. func getPrice를 계산된 가격을 반환한다.
//                      3. 입력받은 배열을 Set으로 만든뒤
//                          i) 1개일 경우 -  50,000원+(같은 눈)*5,000원의 상금
//                          ii) 2개일 경우
//                              가) 같은 눈이 3개 - 10,000원+(3개가 나온 눈)*1,000원의 상금
//                              나) 같은 눈이 2개씩 두 쌍이 나오는 경우 - 2,000원+(2개가 나온 눈)*500원+(또 다른 2개가 나온 눈)*500원원의 상금
//                          iii) 3개일 경우 - 1,000원+(같은 눈)*100원의 상금
//                          iv) 4개일 경우 - (그 중 가장 큰 눈)*100원의 상금
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/25.
//

import Foundation
