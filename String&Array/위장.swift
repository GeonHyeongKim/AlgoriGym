//
//  위장.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42578
//  Primary idea:       <String & Array> - Hash
//                      1. Dictionary를 이용해 [종류 : [상품명]]을 수집
//                      2. 종류별 갯수를 배열로 만든다.
//                      3. reduce를 이용해 모든 경우의 수를 구한다.
//                         i) 각 원소에 +1을 하여 안입은 경우를 표현한다.
//                         ii) -1을 하여 모두 다 입지 않는 경우를 고려한다.
//
//  Time Complexity : O(n logn)
//  Space Complexity : O(n)
//  Runtime: 0.31 ~ 2.48 ms
//  Memory Usage: 24.0 ~ 24.3 MB
//
//  Created by gunhyeong on 2020/06/24.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dic = [String:[String]]()
    
    for clothe in clothes {
        let name = clothe[0]
        let category = clothe[1]
                
        if dic.keys.contains(category) { // dic에 종류가 존재할 경우
            dic[category]!.append(name)
        } else {
            dic[category] = [name] // 새로운 종류 일경우
        }
    }
    
    let count = dic.mapValues{$0.count}.values // 종류별 갯수를 담은 배열ㄴ
    return count.reduce(1){$0*($1+1)}-1  // +1 : 안입는 경우, -1 : 모두 다 안입는 경우
}

//MARK:- 2번쨰 재풀이
//  Time Complexity : O(n logn)
//  Space Complexity : O(n)
//  Runtime: 0.09 ~ 0.45 ms
//  Memory Usage: 15.9 ~ 16.2 MB

func solution(_ clothes:[[String]]) -> Int {
    var dic = [String:[String]]()
    
    for cloth in clothes {
        let name = cloth.first!
        let category = cloth.last!
        
        if dic.keys.contains(category) {
            dic[category]!.append(name)
        } else {
            dic[category] = [name]
        }
    }
    
    let cntCategory = dic.mapValues{$0.count}.values
    return cntCategory.reduce(1){$0*($1+1)}-1
}
