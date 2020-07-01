//
//  중복 숫자 갯수.swift
//  Question Link: https://blog.naver.com/boostcamp_official/221978031932
//  Primary idea:       <String & Array> - Hash
//                      1. dictionary를 사용해 종류 별 갯수를 구별한다.
//                      2. dictionary를 정렬후, 1이 아닌 값들을 모은다.
//                      3. 만약 중복된 갯수가 없을 경우 -1을 return한다
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/01.
//

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var map = [Int:Int]() // 종류:갯수
    
    for number in arr {
        if map.keys.contains(number) {
            map[number]! += 1
        } else {
            map[number] = 1
        }
    }
    
    let result = map.sorted(by: {$0.key < $1.key}).filter({$0.value != 1}).map {$0.value}
    
    return result.count > 0 ? result : [-1]
}

print(solution([1, 2, 3, 3, 3, 3, 4, 4])) // [4, 2]
print(solution([3, 2, 4, 4, 2, 5, 2, 5, 5])) // [3, 2, 3]
print(solution([3, 5, 7, 9, 1])) // [-1]

