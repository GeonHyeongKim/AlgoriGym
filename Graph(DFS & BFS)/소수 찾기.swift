//
//  소수 찾기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42839?language=swift
//  Primary idea:       <DFS & BFS> - DFS
//                      1. DFS와 에라토스테네스의 체 이용
//                      2. DFS를 통해 모든 경우의 수를 구한다.
//                      3. 해당 숫자가 소수(Prime)인지 아닌지를 판단 후 맞으면 결과값에 저장한다.
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(n)
//  Runtime: 0.19 ~ 189.22 ms
//  Memory Usage: 24.1 ~ 24.3 MB
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
    
    //MARK:- dfs2
//    for i in 0..<numbers.count {
//        dfs2(numbers, &result, i, &curNumber, &visited)
//    }
    
    //MARK:- dfs3
//    for i in 0..<numbers.count {
//        visited[i] = true
//        let stringIndex = numbers.index(numbers.startIndex, offsetBy: i)
//        dfs3(numbers, &result, String(numbers[stringIndex]), &visited, numbers.count)
//        visited[i] = false
//    }
    
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
//MARK:- dfs2
func dfs2(_ numbers: String, _ result: inout Set<Int>, _ index: Int, _ curNumber: inout String, _ visited: inout [Bool]) {
    visited[index] = true
    let stringIndex = numbers.index(numbers.startIndex, offsetBy: index)
    curNumber += String(numbers[stringIndex])

    let intCur = Int(curNumber)!
    if !result.contains(intCur) && isPrime(intCur) {
        result.insert(intCur)
    }

    for i in 0..<numbers.count {
        if !visited[i] {
            dfs2(numbers, &result, i, &curNumber, &visited)
        }
    }
    curNumber.removeLast()
    visited[index] = false
}
//MARK:- dfs3
func dfs3(_ numbers: String, _ result: inout Set<Int>, _ cur: String, _ isVisit: inout [Bool], _ size: Int) {
    if size < 0 {
        return
    }

    let intCur = Int(cur)!
    if isPrime(intCur) {
        result.insert(intCur)
    }
    
    for i in 0..<numbers.count {
        if !isVisit[i] {
            let stringIndex = numbers.index(numbers.startIndex, offsetBy: i)
            isVisit[i] = true
            dfs3(numbers, &result, cur + String(numbers[stringIndex]), &isVisit, size-1)
            isVisit[i] = false
        }
    }
}

// 소수 인지 판별
func isPrime(_ number: Int) -> Bool {
    if number < 2 { return false }
    let sqrtNumber = Int(sqrt(Double(number)))
    for i in 2..<number where i<=sqrtNumber {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}

print(solution("17")) // 3
print(solution("011")) // 2
