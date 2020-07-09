//
//  튜플.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/64065
//  Primary idea:       <String & Array> - components(separatedBy:), filter()
//                      1. 문자열이 넘어오기 때문에 "{","}"를 제거한 배열에서 "", ","가 아닌 배열로 다시 재구성한다.
//                      2. 정렬을 해야하는데 이때 배열의 크기순으로 정렬한다.
//                      3. 정렬한 tuple들의 값을 하나씩 꺼내면서 ","를 제거한 값을 구한다.
//                      4. ","가 제거된 배열 값을 순회하면서 각 요소를 Int()형으로 바꾼다.
//                      5. 결과값에 포함되어 있지 않으면 결과값에 포함시킨다.
//
//  Time Complexity : O(n^2)
//  Space Complexity : O(n)
//  Runtime: 0.50 ~ 3008.15 ms
//  Memory Usage: 23.8 ~ 25.7 MB
//
//
//  Created by gunhyeong on 2020/07/09.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var result = [Int]()
    let tuples = s.components(separatedBy: ["{","}"]).filter({$0 != "" && $0 != ","})
    let sortedTuples = tuples.sorted(by: {$0.count < $1.count})
    
    for tuple in sortedTuples {
        let removeComma = tuple.components(separatedBy: ",")
        for element in removeComma {
            guard let intElement = Int(element) else { continue }
            if !result.contains(intElement) {
                result.append(intElement)
            }
        }
    }
    
    return result
}
