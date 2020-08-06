//
//  괄호 추가하기.swift
//  Question Link: https://www.acmicpc.net/problem/16637
//  Primary idea:       (DFS & Brute force)
//                      1. 2번의 재귀
//                          i) 이전 계산 결과와 오른쪽에 있는 피연산자를 피연산자로 하여 현재 가리키는 연산자의 연산을 수행하는 함수
//                          ii) 2. 이전 계산 결과와 오른쪽에 있는 연산자의 연산 수행 결과를 피연산자로 하여 현재 가리키는 연산자의 연산을 수행하는 함수
//                      2. 재귀의 탈출 조건 - 연산자의 인덱스를 초과하여 현재 가리키는 연산자가 없는 경우
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/05.
//

import Foundation

let len = Int(readLine()!)!
let equation = readLine()!
var oper = [Character]()
var num = [Int]()
var answer = 0

for value in equation {
    if value.isNumber {
        num.append(value.wholeNumberValue!)
    } else {
        oper.append(value)
    }
}

dfs(0, num[0])
print(answer)

func dfs(_ i: Int, _ sum: Int) {
    if i >= oper.count {
        if answer < sum {
            answer = sum
        }
        
        return
    }
    
    let calculation1 = calculation(sum, num[i+1], oper[i])
    dfs(i+1, calculation1)
    
    if i+1 < oper.count {
        let calculation2 = calculation(num[i+1], num[i+2], oper[i+1])
        dfs(i+2, calculation(sum, calculation2, oper[i]))
    }
}

func calculation(_ base: Int, _ other: Int, _ oper: Character) -> Int {
    switch oper {
    case "+": return base + other
    case "-": return base - other
    case "*": return base * other
    default: return 0
    }
}
