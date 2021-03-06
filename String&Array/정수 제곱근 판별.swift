//
//  정수 제곱근 판별.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12934?language=swift
//  Primary idea:       <String & Array> - sqrt, pow
//                      1. n을 double로 바꾼다.
//                      2. sqrt를 이용해 제곱근을 구한다.
//                      3. 제곱급관 소수점을 버린값을 비교하여 제곱근이 더 클 경우 -1을 return, 아닌 경우 제곱근의 1을 더한값의 제곱을 구한다.
//
//  Time Complexity : O(1)
//  Space Complexity : O(1)
//  Runtime: 0.09 ~ 0.16 ms
//  Memory Usage: 24.1 ~ 24.4 MB
//
//  Created by gunhyeong on 2020/07/03.
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    let doubleTypeN = Double(n)
    let sqrtN = sqrt(doubleTypeN)
    
    return sqrtN > Double(Int(sqrtN)) ? -1 : Int64(pow(sqrtN+1, 2))
}
