//
//  걸그룹 마스터 준석이.swift
//  Question Link: https://www.acmicpc.net/problem/16165
//  Primary idea:       (Dictionary)
//                      1. Dictionary를 이용해, 그룹명과 그룹멤버의 이름을 저장한다.
//                      2. 저장된 Dictionary에서 퀴즈 유형에 따른 String을 출력한다
//                          i) 0 일때, 오름차순으로 정렬된 걸그룹 멤버들의 이름을 출력한다.
//                          ii) 1 일떄, 멤버가 속해있는 걸그룹의 이름을 출력한다.
//
//  Time Complexity : O(n^m) // n은 걸그룹수, m은 퀴즈의 갯수
//  Space Complexity : O(n)
//  Runtime: 16 ms
//  Memory Usage: 81.352 MB
//
//  Created by gunhyeong on 2020/09/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input.first! // 걸그룹수
let m = input.last! // 맞춰야 할 문제의 수
var girlGroups = [String : [String]]() // 그룹명:[멤버명]

// 걸 그룹 입력
for _ in 0..<n {
    let groupName = readLine()!
    let groupCnt = Int(readLine()!)!
    girlGroups[groupName] = []
    
    for _ in 0..<groupCnt {
        let girlName = readLine()!
        girlGroups[groupName]?.append(girlName)
    }
}

// 퀴즈 시작
for _ in 0..<m {
    let name = readLine()!
    let type = Int(readLine()!)! // 0이면 걸그룹 명, 1이면 멤버
    
    if type == 0 {
        for girName in girlGroups[name]!.sorted() { print(girName) }
    } else { // 1일 경우
        print(girlGroups.mapValues({$0.contains(name)}).filter({$0.value}).keys.first!)
    }
}
