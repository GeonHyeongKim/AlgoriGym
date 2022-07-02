//
//  Prim.swift
//  Algorithm
//
//  Created by gunhyeong on 2020/06/06.
//  Copyright © 2020 geonhyeong. All rights reserved.
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
