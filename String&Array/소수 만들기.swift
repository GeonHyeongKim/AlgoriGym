//
//  소수 만들기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12977
//  Primary idea:       <String & Array>
//                      1. nums의 길이가 3~50개 임으로, 3중 반복문을 통해 모든 경우의 수를 구한다.
//                      2. 반복문의 첫번쨰 + 두번째 + 세번째 Index값들을 더해 소수인지 판단한다.
//                      3. isPrime(Int:)를 통해 소수인지 아닌지를 판단후, 맞을 경우 1개씩 증가시킨다.
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
