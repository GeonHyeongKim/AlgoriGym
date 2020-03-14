/*
*  실패율.swift
*  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42889
*  Primary idea:   <Brute force>
*                  1. 실패율구하기
*                      1) filter를 사용하여 분자 구하기 : stage - 1 < x < stage + 1
*                      2) filter를 이용해서 분모 구하기 : stage이상일 경우
*                      3) key : stage, value : 분자 / 분모
*                  2. 다중 정렬 - lambda식으로 정렬
*                      1) value
*                      2) key
*
*  Time Complexity:
*  Space Complexity:
*  result :
*
*  Created by gunhyeong on 2020/03/14.
*/

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    guard 1 <= N && N <= 500 else { // Constrains 1
        return []
    }
    
    guard 1 <= stages.count && stages.count <= 200000 else { // Constrains 2
        return []
    }
    
    if stages.count == 1 {
        return [stages.first!]
    }
    
    var failureRateListByStage = [Int:Double]()
    let sortedStages = stages.sorted()
    var result = [Int]()
    var notClear = [Int]()
    var clear = [Int]()
    
    for stageCnt in 1...N {
        notClear = sortedStages.filter{(($0 < stageCnt + 1) && ($0 > stageCnt - 1))} // 1-1. 분자(clear 못한사람)
        clear = sortedStages.filter{($0 >= stageCnt)} // 1-2. 분모(clear 사람)
        
        failureRateListByStage[stageCnt] = (Double(notClear.count) / Double(clear.count)) // 1-3. 실패율
    }
    
    let sort = failureRateListByStage.sorted(by: { // 2. 다중 정렬 - lambda
        if ($0.1 == $1.1) {
            return ($0.0 > $1.0)
        }
        return ($0.1 < $1.1)
    })
    
    for (key,_) in sort {
        result.append(key)
    }
    
    return result.reversed()
}
