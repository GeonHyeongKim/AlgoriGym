//
//  회의실배정.swift
//  Question Link: https://www.acmicpc.net/problem/1931
//  Primary idea:       <Greedy>
//                      1. sort : 회의 시작 시간을(start) 기준으로 오름차순으로 정렬
//                      2. priority queue 개념 응용 : 회의 종료 시간(end)을 기준으로 먼저 넣는다.
//                      3. end <= start 합치기
//
//  Time Complexity : O(n logn) // sort 정렬
//  Space Complexity : O(1)
//  Runtime: 346 ms
//  Memory Usage: 66.408 MB
//
//  Created by gunhyeong on 2020/05/17.
//

import Foundation

struct Interval {
    var start: Int = 0
    var end: Int = 0
    
    init(start: Int, end: Int) {
        self.start = start
        self.end = end
    }
}

var N = Int(readLine()!)!
var meetings = [Interval] (repeating: Interval.init(start: 0, end: 0), count: N)
var count = 0

for i in 0..<N {
    let input = readLine()!.split(separator: " ")
    meetings[i].start = Int(input[0])! // start
    meetings[i].end = Int(input[1])! // end
}

// 끝나는 시간을 기준으로 정렬
meetings.sort(by: {
    if $0.end == $1.end {
        return $0.start < $1.start
    } else {
        return $0.end < $1.end
    }
})

var endTime = -1

for meet in meetings {
    // 현재시간(끝난시간)이 다음 회의의 시작시간보다 작거나 같다면
    if endTime <= meet.start {
        count += 1
        endTime = meet.end
    }
}

print(count)
