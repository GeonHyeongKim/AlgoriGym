//
//  The candy war.swift
//  Question Link: https://www.acmicpc.net/problem/9037
//  Primary idea:       (Simulation)
//                      1. testCase만큼 반복문을 돈다.
//                      2. check 합수를 만들어 홀수개의 candy를 가진 아이에게 사탕을 채워줄때 모두 값이 같아지는지 확인
//                      3. rightCandy : 오른쪽에 채워줘야하는 값을 새로운 배열값을 만들어 저장해 놓는다.
//                      4. candy의 개수가 홀수인 아이에의 값을 1을 추가해준다.
//                      5. candy를 반으로 나누고 오른쪽에 채워줘야하는 값을 배열에 저장해 놓는다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/23.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let child = Int(readLine()!)!
    var candys = readLine()!.split(separator: " ").map{Int($0)!}
    var process = 0
    
    while !check(candys) {
        process += 1
        var rightCandy = [Int](repeating: 0, count: child)

        for i in 0..<candys.count {
            if candys[i] % 2 == 1 {
                candys[i] += 1
            }
            
            candys[i] /= 2
            rightCandy[(i+1) % child] = candys[i]
        }
        
        for i in 0..<child {
            candys[i] += rightCandy[i]
        }
    }
    
    print(process)
}


func check(_ candys: [Int]) -> Bool {
    var candy = candys
    for i in 0..<candy.count {
        if candy[i] % 2 == 1 {
            candy[i] += 1
        }
    }
    return Set(candy).count == 1
}
