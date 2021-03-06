//
//  타겟 넘버.swift
//  Question Link:https://programmers.co.kr/learn/courses/30/lessons/43165
//  Primary idea:       <DFS & BFS>
//                      1. dfs로 문제 풀이
//                      2. node의 크기(index)와 numbers의 갯수가 같을때, sum == target이 같은지 확인
//                          i) 같으면 1을 return
//                          ii) 다르면 0을 return
//                      3. dfs에 sum에 해당값을 더했을경우(왼쪽) + sum에 해당값을 뺏했을경우(오른쪽)값을 return
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(1)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/04.
//

import Foundation

//func solution(_ numbers:[Int], _ target:Int) -> Int {
//    return dfs(numbers, target, 0, 0)
//}
//
//func dfs(_ numbers: [Int], _ target: Int, _ node: Int, _ sum: Int) -> Int{
//    if node == numbers.count {
//        return sum == target ? 1 : 0
//    }
//
//    return dfs(numbers, target, node+1, sum + numbers[node]) + dfs(numbers, target, node+1, sum - numbers[node]) // 왼쪽, 오른쪽
//}

//MARK:- 2번째 재풀이
//  Time Complexity : O(n^n)
//  Space Complexity : O(1)
//  Runtime: 0.08 ~ 35.72 ms
//  Memory Usage: 15.9 ~ 16.4 MB

func solution(_ numbers:[Int], _ target:Int) -> Int {
    return dfs(numbers, target, 0, 0)
}

func dfs(_ numbers: [Int], _ target: Int, _ index: Int, _ sum: Int) -> Int {
    if index == numbers.count { return sum == target ? 1 : 0 }
    
    return dfs(numbers, target, index+1, sum+numbers[index]) + dfs(numbers, target, index+1, sum-numbers[index])
}
