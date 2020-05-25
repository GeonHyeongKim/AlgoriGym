//
//  반도체 설계.swift
//  Question Link: https://www.acmicpc.net/problem/2352
//  Primary idea:       <Greedy>
//                      MARK: - 이진 탐색(Binary Search) : O(N LogN)
//                      1) case1, array[i]가 dp(i-1)의 마지막 항 보다 큰 경우.
//                      2) case2, array[i]가 dp(i-1)의 마지막 항에 비해서만 작은 경우.
//                      3) case3, array[i]가 중간항에 비교해서 작을 경우. -> lower_bound(이분 탐색을 통해 해당하는 위치를 return) 이용
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/05/24.
//

import Foundation

var n = Int(readLine()!)!
var port = readLine()!.split(separator: " ").map {Int($0)!}
var lis = [Int](repeating: 0, count: n)

lis[0] = port[0]
var lisIndex = 1

for i in 1..<n {
    if lis[lisIndex-1] < port[i] {
        lis[lisIndex] = port[i]
        lisIndex += 1
    } else {
        let index = lowerBound(arr: &lis, start: 0, end: lisIndex, target: port[i])
        lis[index - 1] = port[i]
    }
}

print(lisIndex)

// Binary search
func lowerBound(arr: inout [Int], start: Int, end: Int, target: Int) -> Int{
    var mid: Int
    var start = start
    var end = end
    
    while (end - start > 0) {  // 주어진 범위[start,end]에서 탐색하도록 한다. start == end이면 반복 종료
        mid = (start + end) / 2  // 주어진 범위의 중간 위치를 계산한다
        
        if (arr[mid] < target){ // 찾고자 하는 값보다 작으면 오른쪽으로 한 칸만 더 시작 구간 갱신
            start = mid + 1
        } else {// 찾고자 하는 값보다 크면 거기까지 끝 구간 갱신
            end = mid;
        }
    }
    return end + 1; // 찾는 구간에 없는 경우 가장 마지막 +1 위치 전달
}
