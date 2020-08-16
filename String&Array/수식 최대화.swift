//
//  수식 최대화.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/67257
//  Primary idea:       <String & Array>
//                      1.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime: ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/15.
//

import Foundation

var numbers = [Int]()
var operands = [Character]()

func solution(_ expression:String) -> Int64 {
    var answer = 0
    var priorityList = [[String]]()
    var visited = [Bool](repeating: false, count: 3)
    
    getPriority(&priorityList, &visited, [], ["+","-","*"])
    
    numbers = expression.components(separatedBy: ["+","-","*"]).map{Int($0)!}
    operands = Array(expression.filter({!$0.isNumber}))
    
    for priority in priorityList {
        var copyNumbers = numbers
        var copyOperands = operands
        for p in priority {
            var i = -1
            while i < copyOperands.count - 1 {
                i += 1
                if p == String(copyOperands[i]) {
                    print(copyNumbers)
                    print(copyOperands)
                    let cal = calculation(copyNumbers.remove(at: i), copyNumbers.remove(at: i), copyOperands[i])
                    copyNumbers.insert(cal, at: i)
                    copyOperands.remove(at: i)
                    i -= 1
                }
            }
        }
        
        print(copyNumbers)
        answer = max(answer, abs(copyNumbers.first!))
    }
    
    return Int64(answer)
}

func calculation(_ base: Int, _ other: Int, _ oper: Character) -> Int {
    switch oper {
    case "+": return base + other
    case "-": return base - other
    case "*": return base * other
    default: return 0
    }
}

func getPriority(_ priority: inout [[String]], _ visited: inout [Bool], _ cur: [String], _ operand: [String]) {
    if cur.count == 3 {
        priority.append(cur)
        return
    }
    
    for i in 0..<3 {
        if !visited[i] {
            visited[i] = true
            getPriority(&priority, &visited, cur + [operand[i]], operand)
            visited[i] = false
        }
    }
}

print(solution("100-200*300-500+20")) // 60420
print(solution("50*6-3*2")) // 300
