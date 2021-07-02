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
*  Time Complexity: O(n^n)
*  Space Complexity: O(n^n)
*  result : 88.9점
*
*  Created by gunhyeong on 2020/03/14.
*/

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failureRateListByStage = [Int:Double]()
    
    for stageCnt in 1...N {
        let notClear = stages.filter{($0 == stageCnt)} // 1-1. 분자(clear 못한사람)
        let clear = stages.filter{($0 >= stageCnt)} // 1-2. 분모(clear 사람)
        
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
    
    // 2. 다중 정렬 - 키값으로 정렬한 뒤에 밸류값으로 정렬
    return failureRateListByStage.sorted(by: <).sorted(by: { $0.value > $1.value }).map {$0.key}
}

//MARK: 분모값에 대한 접근 변경 - 성공
// result : 100점
import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var len = stages.count
    var res = [(Int, Double)]()
    
    for i in 1...N {
        let cnt = stages.filter{$0 == i}.count
        
        let fail = len == 0 ? 0.0 : Double(cnt) / Double(len)
        res.append((i, fail))
        len -= cnt
    }
    
    return res.sorted(by: {$0.1 > $1.1}).map{$0.0}
}
