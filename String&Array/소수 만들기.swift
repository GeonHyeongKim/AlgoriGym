//
//  소수 만들기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12977
//  Primary idea:       <DFS>
//                      1. DFS를 통해 모든 경우의 수를 구한다.
//                      2. 경우의 수 중 3개일 경우, 결과값에 포함된 값이 아닌지 확인하고 소수인지 확인 후 return
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/07.
//

import Foundation

// 42.3점 - 나머지 시간초과
func solution(_ nums:[Int]) -> Int {
    var result = [[Int]]()
    var visited = [Bool](repeating: false, count: nums.count)
    var combination = [Int]()
    
    dfs(nums.sorted(), &result, &combination, &visited)

    return result.count
}

func dfs(_ nums:[Int], _ result: inout [[Int]], _ combination: inout [Int], _ visited: inout [Bool]){
    if combination.count == 3 && !result.contains(combination.sorted()){
        if isPrime(combination.reduce(0, +)) {
            result.append(combination)
        }
        return
    }
    
    for i in 0..<nums.count {
        if !visited[i] {
            visited[i] = true
            combination.append(nums[i])
            dfs(nums, &result, &combination, &visited)
            combination.removeLast()
            visited[i] = false
        }
    }
}

// 소수 인지 판별
func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}
