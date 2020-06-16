//
//  여행경로.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/43164
//  Primary idea:       <DFS & BFS> - DFS
//                      1. DFS로 문제 풀이
//                      2. 중요한 요구 사항 Check
//                          i) 항상 ICN 공항에서 출발
//                          ii) 모든 도시를 방문할 수 없는 경우는 주어지지 않습니다. 주어진 항공권은 모두 사용해야 합니다.
//                          iii) 만일 가능한 경로가 2개 이상일 경우 알파벳 순서가 앞서는 경로를 return 합니다. --> 정렬 필요
//                      3. 종료 조건 : 주어진 항공권을 통하여 모든 경로를 탐색하여 롼료한 경우
//                      4. visited([Bool])을 통해 방문했던 항공사인지 확인
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/10.
//

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var result = [String]()
    var visited = [Bool](repeating: false, count: tickets.count)
    let sortedTickets = tickets.sorted(by: { $0[1] < $1[1] })
    var path: [String] = []

    dfs(sortedTickets, &visited, &result, &path, "ICN", 0)
    
    return result
}

func dfs(_ tickets: [[String]], _ visited: inout [Bool], _ result: inout [String], _ path: inout [String], _ from :String, _ depth: Int) {
    path.append(from)
    
    if depth == tickets.count {
        result = path
        return
    }
    
    for i in 0..<tickets.count where result.isEmpty{
        if tickets[i][0] == from && visited[i] == false {
            visited[i] = true
            dfs(tickets, &visited, &result, &path, tickets[i][1], depth+1)
            visited[i] = false
        }
    }
    
    path.removeLast()
}

print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))
