//
//  가운데 글자 가져오기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12903
//  Primary idea:       <String & Array>
//                      1. 글자수가 짝수인지 아닌지 확인한다
//                          i) 짝수 : 중간 인덱스와 중간 인덱스보다 1작은 값
//                          i) 홀수 : 중간 인덱스의 값
//
//  Time Complexity : O(1)
//  Space Complexity : O(n)
//  Runtime: 0.09 ~ 0.15 ms
//  Memory Usage: 23.6 ~ 24.1 MB
//
//  Created by gunhyeong on 2020/07/03.
//

import Foundation

func solution(_ s:String) -> String {
    let size = s.count
    let arrS = Array(s)
    let middle = size/2

    if size % 2 == 0 {
        return String(arrS[middle-1...middle])
    } else {
        return String(arrS[middle])
    }
}
