//
//  완주하지 못한 선수.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42576
//  Primary idea:       <String & Array> - Hash
//                      1. 반복문을 통해 participant의 값을 한번씩 체크한다.
//                      2. if문과 contains를 이용해 값이 없는지 확인한다.
//
//  Time Complexity : O(n)
//  Space Complexity : O(1)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/28.
//

import Foundation

func solution(_ participant:[String], _ completion:[String]) -> String {
    for name in participant {
        if !completion.contains(name) {
            return String(name)
        }
    }
    return ""
}
