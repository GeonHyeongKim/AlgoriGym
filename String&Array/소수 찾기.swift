//
//  소수 찾기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42839?language=swift
//  Primary idea:       <String & Array> - Brute force
//                      1. 에라토스테네스의 체 이용
//
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/02.
//

import Foundation

func solution(_ numbers:String) -> Int {
    //    var num = numbers.compactMap{$0.wholeNumberValue} // String -> [Int]
    var num = Array(numbers) // String -> [Character]
    var result = Set<Int>() // 결과
    var isVisit = [Bool](repeating: false, count: num.count)
    var cur = [Character]()
    
    dfs(&num, &result, &cur, &isVisit)
    
    return result.count
}

func dfs(_ numbers: inout [Character], _ result: inout Set<Int>, _ cur: inout [Character], _ isVisit: inout [Bool]) {
    var finished = true
    
    for flag in isVisit {
        if !flag {
            finished = false
            break
        }
    }
    
    if finished {
        return
    }

    for i in 0..<numbers.count {
        if !isVisit[i] {
            cur.append(numbers[i])
                    
            let intCur = Int(String(cur))!
            if isPrime(intCur) {
                result.insert(intCur)
            }
            isVisit[i] = true
            dfs(&numbers, &result, &cur, &isVisit)
            isVisit[i] = false
            cur.removeLast()
        }
    }
}

// 소수 인지 판별
func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}
