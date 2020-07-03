//
//  최솟값 만들기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12941
//  Primary idea:       <String & Array> - 정렬
//                      1. 매개변수 A,B를 각각 오름차순으로 정렬한다.
//                      2. 배열의 크기만큼 돌면서 A는 가장 앞에서 부터, B는 가장 뒤에서부터 곱해간다
//                      3. 곱한값의 누적합을 구한다.
//
//  Time Complexity : O(n)
//  Space Complexity : O(1)
//  Runtime: 0.19 ~ 0.74 ms
//  Memory Usage: 24.0 ~ 24.4 MB
//
//  Created by gunhyeong on 2020/07/03.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    let sortedA = A.sorted()
    let sortedB = B.sorted()
    let size = sortedA.count
    var sum = 0
    
    for i in 0..<size {
        sum += sortedA[i] * sortedB[size - i - 1]
    }

    return sum
}
