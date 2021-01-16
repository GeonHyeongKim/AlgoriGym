//
//  aj-2.swift
//  
//
//  Created by gunhyeong on 2021/01/16.
//

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0] // 수강신청이 가능한 과목의 수
let m = info[1] // 수강신청 학생 수
let k = info[2] // 수강신청 기록의 수
var limit = readLine()!.split(separator: " ").map{Int($0)!} // 제한 인원
limit.insert(0, at: 0)
var student = [(Int, Int)](repeating: (0, 0), count: m+1)

for _ in 0..<k {
    let record = readLine()!.split(separator: " ").map{Int($0)!}
    let no = record[0]
    let subject = record[1]

    if limit[subject] > 0 {
        limit[subject] -= 1
        student[no] = (student[no].0 + 1, student[no].1 + 1)
    } else {
        student[no] = (student[no].0, student[no].1 + 1)
    }
}

for (numerator, denominator) in student[1...m] {
    if numerator == 0 {
        print("-1")
    } else if numerator == denominator {
        print("1 1")
    } else {
        print("\(numerator) \(denominator)")
    }
}
