/*
*  한 줄로 서기.swift
*  Question Link: https://www.acmicpc.net/problem/1138
*  Primary idea:    <Greedy>
*                    1. 인덱스 번호대로 키가 부여되므로 이미 정렬되어 있는 상태입니다.
*                    2. 왼쪽에 자신보다 키 큰 사람의 수를 입력받습니다.
*                    3. 자기보다 키 큰 사람이 있는 경우 빈 자리를 지나칩니다.
*                    4. 빈 자리이고 2번에서 입력받은 수만큼 키 큰 사람을 지나쳤다면 자신의 자리입니다.
*
*  Time Complexity : O(n^2)
*  Space Complexity : O(n)
*  Runtime:  ms
*  Memory Usage:
*
*  Created by gunhyeong on 2020/04/30.
*/

import Foundation

var N = Int(readLine()!)!
var line = readLine()!.split(separator: " ")
var newLine = [Int](repeating: 0, count: N)

for i in 0..<N {
    var left = Int(line[i])!
    
    for j in 0..<N {
        if left == 0 && newLine[j] == 0 {
            newLine[j] = i + 1
            break
        } else if newLine[j] == 0 {
            left -= 1
        }
    }
}

print(newLine)
