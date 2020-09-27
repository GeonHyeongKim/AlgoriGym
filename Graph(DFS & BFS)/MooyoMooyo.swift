//
//  MooyoMooyo.swift
//  Question Link: https://www.acmicpc.net/problem/16768
//  Primary idea:       (DFS & BFS && Flood fit)
//                      1.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/26.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input.first!
let k = input.last!
var map = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n)
var isVisit = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: n)
var isVisit2 = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: n)
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

for i in 0..<n {
    let cols = readLine()!
    for col in cols {
        map[i].append(col.wholeNumberValue!)
    }
}

var exist = false
while true {
    exist = false
    isVisit = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: n)
    isVisit2 = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: n)
    
    for i in 0..<n {
        for j in 0..<10 {
            if map[i][j] == 0 || isVisit[i][j] { continue }
            let result = dfs(i, j) // 개수 새기
            
            if result >= k {
                dfs2(i, j, map[i][j]) // 지우기
                exist = true
            }
        }
    }
    
    if exist { break }
    
    down() // 내리기
}

print(map)


func dfs(_ x: Int, _ y: Int) -> Int {
    isVisit[x][y] = true
    var result = 1
    
    for i in 0..<4 {
        let xx = x + dx[i]
        let yy = y + dy[i]
        
        if xx < 0 || xx >= n || y < 0 || y >= 10 { continue }
        if isVisit[xx][yy] || dfs(xx, yy) != dfs(x, y) { continue }
        result += dfs(xx, yy)
    }
    
    return result
}

func dfs2(_ x: Int, _ y: Int, _ val: Int) {
    isVisit2[x][y] = true
    map[x][y] = 0
    
    for i in 0..<4 {
        let xx = x + dx[i]
        let yy = y + dy[i]
        
        if xx < 0 || xx >= n || y < 0 || y >= 10 { continue }
        if isVisit[xx][yy] || map[xx][yy] != val { continue }
        dfs2(xx, yy, val)
    }
}

func down() {
    for i in 0..<10 {
        var temp = [Int]()
        for j in 0..<n {
            if map[j][i] != 0 {
                temp.append(map[j][i])
            }
        }
        for j in 0..<(n-temp.count) {
            map[j][i] = 0
        }
        for j in (n-temp.count)..<n {
            map[j][i] = temp[j - (n-temp.count)]
        }
    }
}

