//
//  이름궁합 테스트.swift
//  Question Link: https://www.acmicpc.net/problem/17269
//  Primary idea:       (Simulation)
//                      1. Dictionary로 미리 알파벳에 대응하는 숫자 선언
//                      2. 두 이름의 길이를 비교해 더 작은 갯수만큼 반복문으로 문자열을 번갈아 가며 붙인후, 나머지 값입력
//                      3. 문자열에 맞는 숫자로 대체
//                      4. 2중 반복문을 통해 숫자를 누적해서 더함
//
//  Time Complexity : O((n+m)^2)
//  Space Complexity : O(n)
//  Runtime: 12 ms
//  Memory Usage: 81.340 MB
//
//  Created by gunhyeong on 2020/09/22.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input.first! // 첫번째 이름의 길이
let m = input.last! // 두번째 이름의 길이
let names = readLine()!.split(separator: " ")
let firstName = Array(names.first!)
let secondName = Array(names.last!)
let table: [Character:Int] = ["A":3, "B":2, "C":1, "D":2, "E":4, "F":3, "G":1, "H":3, "I":1, "J":1, "K":3, "L":1, "M":3, "N":2, "O":1, "P":2, "Q":2, "R":2, "S":1, "T":2, "U":1, "V":1, "W":1, "X":2, "Y":2, "Z":1]
var sumName = ""
let minLen = min(n, m)

for i in 0..<minLen {
    sumName += String(firstName[i]) + String(secondName[i])
}

// 나머지 문자열 삽입
sumName += n >= m ? firstName[minLen..<n] : secondName[minLen..<m]

// 문자에 맞는 숫자로 대체
var answer = sumName.map{table[$0]!}

for i in 0..<(n+m-2) {
    for j in 0..<(n+m-1-i) {
        answer[j] += answer[j+1]
        answer[j] %= 10
    }
}

print(answer[0] == 0 ? "\(answer[1])%" : "\(answer[0])\(answer[1])%")
