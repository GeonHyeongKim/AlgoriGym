//
//  Last Stone Weight.swift
//  Question Link: https://leetcode.com/problems/last-stone-weight/
//  Primary idea:   1. 정렬을 내림차순으로 한다.
//                  2. 정렬된 앞 2개를 꺼내어 0인지 아닌지 판단후, 0이 아니면 append
//                  3. 반복문을 통해 배열의 크기가 1 이하이면 탈출
//
//  풀면서 생각해 낸 것 (부족한점)
//                  1. 계속 해서 내림차로 정렬해줘야한다.
//                  2. smash한 값의 절대값 씌우기
//                  3. 결과값이 nil일 경우 0으로 반환
                    

//  Time Complexity :
//  Space Complexity :
//
//  Created by gunhyeong on 2020/02/16.
//

import Foundation

func lastStoneWeight(_ stones: [Int]) -> Int {
    guard stones.count > 1 else {
        return 1
    }
    
    var sortedStrones = stones.sorted(by: >)
    
    while sortedStrones.count > 1 {
        let first = sortedStrones.first
        sortedStrones.removeFirst()

        let second = sortedStrones.first
        sortedStrones.removeFirst()
        
        let smash = Int(abs(first! - second!))
        if smash != 0 {
            sortedStrones.append(smash)
            sortedStrones.sort(by : >)
        }
    }
    
    return sortedStrones.last == nil ? 0 : sortedStrones.last!
}
