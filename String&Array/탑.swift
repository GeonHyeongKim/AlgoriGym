//
//  탑.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42588
//  Primary idea:       <String & Array> - Stack & Queue
//                      1. 준비 : 0으로 초기화된 결과값을 담을 배열 (result)
//                      2. 2중 for문으로
//                          i) 시작을 가장 오른쪽 값부터 시작한여 1씩 작아진다.
//                          ii) 해당값(i)부터 왼쪽으로 가면서 값이 커질때, 결과값에 넣고 반복문 중지
//
//  Time Complexity : O(n^2)
//  Space Complexity : O(n)
//  Runtime: 0.17 ~ 1.05 ms
//  Memory Usage: 24.2 ~ 24.4 MB
//
//  Created by gunhyeong on 2020/06/22.
//

import Foundation

func solution(_ heights:[Int]) -> [Int] {
    var result = [Int](repeating: 0, count: heights.count)
    let size = heights.count
    
    for i in stride(from: size - 1, through: 0, by: -1) {
        for j in stride(from: i, through: 0, by: -1) {
            if heights[i] < heights[j] {
                result[i] = j + 1
                break
            }
        }
    }
    
    return result
}

print(solution([6,9,5,7,4]))
