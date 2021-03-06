//
//  회전하는 큐.swift
//  Question Link: https://www.acmicpc.net/problem/1021
//  Primary idea:       (Simulation & 양방향 queue)
//                      1. 문제 이해에 도움을 준 site : http://dailyddubby.blogspot.com/2018/05/128-1021.html
//                      2. 양방향으로 회전한다는 점을 인지
//                      3. Queue의 길이 계산이 중요한 문제! - 뽑으려는 값을 기준으로
//                          i) 왼쪽이 더 짧은 경우 : '왼쪽'으로 밀어가며 첫번째로 위치 할 수 있도록 한다.
//                          ii) 오른쪽이 더 짧은 경우 : '오른쪽'으로 밀어가며 첫번째로 위치 할 수 있도록 한다.
//
//  Time Complexity : ?
//  Space Complexity : O(n)
//  Runtime: 12 ms
//  Memory Usage: 81.336 MB
//
//  Created by gunhyeong on 2020/09/15.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input.first! // queue size
let m = input.last! // 뽑아내려고 하는 수
let popList = readLine()!.split(separator: " ").map{Int($0)!}
var queue = Array(1...n)
var answer = 0

for pop in popList {
    let remove = queue.firstIndex(of: pop)!
    let middle = queue.count / 2
    
//    print("befor : queue: \(queue), remove: \(remove)")
    if remove <= middle {
        for _ in 0..<remove {
            pushLeft(&queue)
        }
        answer += remove
    } else {
        for _ in 0..<queue.count - remove{
            pushRight(&queue)
        }
        answer += queue.count - remove
    }
    
//    print("removeFrist : \(queue.first!)")
    queue.removeFirst()
//    print("after : queue: \(queue), remove: \(remove)\n")
}

// 정답 출력
print(answer)

func pushLeft(_ queue: inout [Int]) {
    queue.append(queue.removeFirst())
}

func pushRight(_ queue: inout [Int]) {
    queue.insert(queue.removeLast(), at: 0)
}

/* solution 1
10 3
1 2 3

answer = 0
*/
 
/* solution 2
10 3
2 9 5

answer = 8
*/
 
/* solution 3
32 6
27 16 30 11 6 23

answer = 59
*/

/* solution 4
10 10
1 6 3 2 7 9 8 4 10 5

answer = 14
*/
