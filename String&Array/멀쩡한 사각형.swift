//
//  멀쩡한 사각형.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/62048?language=swift
//  Primary idea:       <String & Array>
//                      1. 두 수의 최소 공배수를 구한다.
//                      2. 공배수가 1이면 두 수를 더한 값에 1을 빼고, 아니면 공배수값을 뺀값이 막힌 갯수이다.
//                      3. 두 수를 곱한 뒤, 막힌 갯수를 뺴준다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/03.
//

import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    let gcd = GCD(min(w,h), max(w,h))
    let block = gcd == 1 ? (w+h)-1 : (w+h)-gcd
    return Int64((w*h) - block)
}

//최소 공배수
func GCD(_ min: Int, _ max: Int) -> Int {
    let remain = min % max
    return remain == 0 ? max : GCD(max, remain)
}
