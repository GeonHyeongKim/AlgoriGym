//
//  p-2.swift
//  
//
//  Created by gunhyeong on 2020/11/07.
//

import Foundation

import Foundation

let compareList = ["A+": 13, "A0":12, "A-":11, "B+":10, "B0":9, "B-":8, "C+":7, "C0":6, "C-":5, "D+":4, "D0":3, "D-":2,"F":1]

func solution(_ grades:[String]) -> [String] {
    var dict = [String:(String, Int)]()
    
    for (i, info) in grades.enumerated() {
        let split = info.split(separator: " ").map({String($0)})
        let name = split.first!
        let grade = split.last!
        
        if dict.keys.contains(name) {
            let upperGrade = compareGrade(dict[name]!, (grade, i))
            dict[name] = upperGrade
        } else {
            dict[name] = (grade, i)
        }
    }

    let answer = dict.sorted(by: {
        if compareList[$0.value.0]! < compareList[$1.value.0]! {
            return true
        } else if compareList[$0.value.0]! > compareList[$1.value.0]! {
            return false
        } else {
            if $0.value.1 <= $1.value.1 {
                return true
            } else {
                return false
            }
        }
    })

    var result = [String]()
    for a in answer {
        print(a)
        result.append("\(a.key) \(a.value.0)")
    }

    return result
}

func compareGrade(_ base: (String, Int), _ target: (String, Int)) -> (String, Int) {
    return compareList[base.0]! >= compareList[target.0]! ? base : target
}
print(solution(["DS7651 A0"]))
//print(solution(["DS7651 A0", "CA0055 D+", "AI5543 C0", "OS1808 B-", "DS7651 B+", "AI0001 F", "DB0001 B-", "AI5543 D+", "DS7651 A+", "OS1808 B-"]))
//print(solution(["DM0106 D-", "PL6677 B+", "DM0106 B+", "GP0001 C0", "DM0106 B+", "PL6677 C0", "GP0000 A0", "DM0108 A+", "GP0001 A0", "AI0001 F"]))
