//
//  aj-3.swift
//  
//
//  Created by gunhyeong on 2021/01/16.
//

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0] // 소문을 내고자 하는 대상의 수
let m = info[1] // 사람들의 관계를 나타내는 수
let k = info[2] // 변질된 수치의 제한 값
var figure = readLine()!.split(separator: " ").map{Int($0)!} // 내용이 변질되는 수치
figure.insert(0, at: 0)
var relationDio = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
var isVisit = [Bool](repeating: false, count: n+1)

for _ in 0..<m {
    let relation = readLine()!.split(separator: " ").map{Int($0)!}
    let a = relation[0]
    let b = relation[1]
    relationDio[a][b] = 1
    relationDio[b][a] = 1
}
var count = 0
for i in 1...n {
    if isVisit[i] {
        continue
    }
    go(i, 0)
    count += 1
}
print(count)


func go(_ index: Int, _ sum: Int) {
    if isVisit[index] { return }
    isVisit[index] = true

    for i in 1...n {
        if isVisit[i] { continue }
        if relationDio[index][i] == 0 { continue }
        if sum + figure[index] > k {
            isVisit[index] = false
            continue
        }
        go(i, sum + figure[index])
    }
}
