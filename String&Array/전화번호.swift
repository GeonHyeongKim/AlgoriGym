//
//  전화번호.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42577
//  Primary idea:       <String & Array> - 해쉬
//                      1. 2중 반복문을 통해 모든 경우의 수를 계산
//                      2. 전화번호(number)와 비교할 전화번호가 같은 번호이면 continue
//                      3. 접두사인지 판별 starts()를 이용
//
//  Time Complexity : O(n^2)
//  Space Complexity : O(1)
//  Runtime: 0.51 ~ 0.71 ms, java로 풀이
//  Memory Usage: 50.2 ~ 52.3 MB // java로 풀이
//
//  Created by gunhyeong on 2020/06/27.
//

import Foundation

func solution(_ phone_boo: [String]) -> Bool {
    for number in phone_boo {
        for compare in phone_boo {
            if number == compare {
                continue
            }
            
            if compare.starts(with: number) {
                return false
            }
        }
    }

    return true
}
