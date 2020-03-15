/*
*  실패율.swift
*  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42889
*  Primary idea:   <Brute force>
*                  1. 실패율구하기
*                      1) filter를 사용하여 분자 구하기 : stage의 갯수
*                      2) filter를 이용해서 분모 구하기 : stage이상 갯수, 0일때 처리
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
    var failureRateListByStage = [Int:Double]()
    let sortedStages = stages.sorted()
    var notClear = [Int]()
    var clear = [Int]()
    
    for stageCnt in 1...N {
        notClear = sortedStages.filter{($0 == stageCnt)} // 1-1. 분자(clear 못한사람)
        clear = sortedStages.filter{($0 >= stageCnt)} // 1-2. 분모(clear 사람)
        
        if notClear.count == 0 || clear.isEmpty {
            failureRateListByStage[stageCnt] = 0.0 // 분모가 0일때
        } else {
            failureRateListByStage[stageCnt] = (Double(notClear.count) / Double(clear.count)) // 1-3. 실패율
        }
    }
    
//    let sort = failureRateListByStage.sorted(by: { // 2. 다중 정렬 - lambda
//        if ($0.1 == $1.1) {
//            return ($0.0 < $1.0)
//        }
//        return ($0.1 > $1.1)
//    })
//
//    for (key,_) in sort {
//        result.append(key)
//    }
    
    // 키값으로 정렬한 뒤에 밸류값으로 정렬
    return failureRateListByStage.sorted(by: <).sorted(by: { $0.value > $1.value }).map {$0.key} // 2. 다중 정렬
}
