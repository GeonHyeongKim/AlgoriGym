/*
    세계 여행.swift
    [Question Link] : 위클리 비타알고 시즌2 강의
    https://edu.goorm.io/lecture/15551/%25ED%2594%2584%25EB%25A6%25AC%25EB%25AF%25B8%25EC%2597%2584-%25EC%2595%258C%25EA%25B3%25A0%25EB%25A6%25AC%25EC%25A6%2598-%25EC%259C%2584%25ED%2581%25B4%25EB%25A6%25AC-%25EB%25B9%2584%25ED%2583%2580%25EC%2595%258C%25EA%25B3%25A0-%25EC%258B%259C%25EC%25A6%258C2-%25EC%259E%2585%25EB%25AC%25B8%25ED%258E%25B8

    [문제]
    어릴 적부터 세계 여행을 꿈꿔왔던 홍현이는 꿈을 이루기 위해 세계 여행을 떠나고자 한다.
    돈은 충분히 모았기 때문에 아무런 문제 없이 여행을 떠날 수 있을 줄 알았지만, 최근 홍현이는 자신에게 고소공포증이 있다는 것을 깨달았다.
    하지만 시간 낭비를 하지 않기 위해 어쩔 수 없이 비행기를 타야만 하기에 가장 적은 시간동안 비행기를 타는 방법이 없을지 고민을 하고 있던 참이다.

    홍현이의 계획은 N개의 국가를 중복 없이 모두 방문하고 다시 출발했던 나라로 돌아오는 것이다.
    고소공포증이 있는 홍현이가 비행기를 최소로 탈 수 있도록 도와주기 위해,
    국가와 국가 사이를 비행기를 타고 이동하는 데 걸리는 시간이 주어졌을 때 홍현이가 모든 국가를 방문하고 처음 출발했던 나라로 돌아오기 위해 걸리는 최소 시간을 구해보자.

    [입력]
    홍현이가 방문하고자 하는 국가의 수 이 주어진다. (2 <= N <= 6)
    이후 N * N 크기의 행렬의 형태로 비행기를 타고 이동하는 데 걸리는 시간이 주어진다.
    a_ij는 i번 국가에서 j번 국가로 이동하기 위해 걸리는 시간을 뜻하며 a_ij = 0 인 경우, i번 국가에서 j번 국가로 이동할 수 없음을 뜻한다. (0<=a_ij<1,000)
 
    [출력]
    홍현이가 개의 국가를 모두 방문하고 출발했던 국가로 돌아오는 데 걸리는 최소 시간을 출력한다.

    [Primary idea] : 동적 계획법
    1. 완전탐색(O(n!))으로는 시간이 부족할 것이다 -> 동적계획법
    2. 요약 : 모든 나라를 한 번씩 방문하고 1번 나라로 돌아오는데 걸리는 최단 시간

    Time Complexity : O(n^n)
    Space Complexity : O(n^2)

    Created by gunhyeong on 2021/01/19.
*/

import Foundation

let n = Int(readLine()!)! // 방문하고자 하는 국가의 수
var route = [[Int]]()

// input
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map{Int($0)!}
    route.append(row)
}
var d = [[Int]](repeating: [Int](repeating: -1, count: 16), count: 1<<16)
let inf = 1_000_000_000

print(TSF(0, 1))

func TSF(_ cur: Int, _ stat: Int) -> Int {
    if stat == (1<<n - 1) { //모든 지역을 방문한 경우
        return route[cur][0] != 0 ? route[cur][0] : inf // 현재 지역에서 출발지(0)로 이동 가능한지
    }
    
    if d[stat][cur] != -1 { return d[stat][cur] } // 만약 답이 이미 메모되어있으면 답을 리턴
    d[stat][cur] = inf
    
    for i in 0..<n {
        if (stat & (1<<i)) == 0 && route[cur][i] != 0 { // i번째 지역을 방문한적이 없고, 이동 가능하면
            d[stat][cur] = min(d[stat][cur], TSF(i, stat | (1<<i)) + route[cur][i]) // i번째 지역 방문체크 후 이동
        }
    }
    
    return d[stat][cur]
}
