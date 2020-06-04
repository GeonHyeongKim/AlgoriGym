//
//  소수 찾기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42839?language=swift
//  Primary idea:       <String & Array> - Brute force
//                      1. 에라토스테네스의 체 이용
//
//  Time Complexity : O(n^n)
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
    var cur = ""
    
    dfs(&num, &result, &cur, &isVisit)
    
    return result.count
}

func dfs(_ numbers: inout [Character], _ result: inout Set<Int>, _ cur: inout String, _ isVisit: inout [Bool]) {
    for i in 0..<numbers.count {
        if !isVisit[i] {
            cur.append(numbers[i])
                    
            print(cur)
            let intCur = Int(String(cur))!
            if !cur.isEmpty && isPrime(intCur) {
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
    let num = Int(floor(sqrt(Double(number))))
    return number > 1 && !(2...num).contains { number % $0 == 0 }
}
