//
//  소수 찾기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42839?language=swift
//  Primary idea:       <DFS & BFS> - DFS
//                      1. DFS와 에라토스테네스의 체 이용
//                      2. DFS를 통해 모든 경우의 수를 구한다.
//                      3. 해당 숫자가 소수(Prime)인지 아닌지를 판단 후 맞으면 결과값에 저장한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/02.
//

import Foundation

func solution(_ numbers:String) -> Int {
    var result = Set<Int>() // 결과
    var visited = [Bool](repeating: false, count: numbers.count)
    var curNumber = ""
    
    //MARK:- dfs
    dfs(numbers, &result, &curNumber, &visited)
    return result.count
}
//MARK:- dfs
func dfs(_ numbers: String, _ result: inout Set<Int>, _ cur: inout String, _ isVisit: inout [Bool]) {

    for i in 0..<numbers.count {
        if !isVisit[i] {
            let stringIndex = numbers.index(numbers.startIndex, offsetBy: i)
            cur.append(numbers[stringIndex])

            let intCur = Int(String(cur))!
            if !cur.isEmpty && isPrime(intCur) {
                result.insert(intCur)
            }
            isVisit[i] = true
            dfs(numbers, &result, &cur, &isVisit)
            isVisit[i] = false
            cur.removeLast()
        }
    }
}

print(solution("17")) // 3
print(solution("011")) // 2
