/*
    부업의 달인.swift
    [Question Link] : 위클리 비타알고 시즌2 강의
    https://edu.goorm.io/lecture/15551/%25ED%2594%2584%25EB%25A6%25AC%25EB%25AF%25B8%25EC%2597%2584-%25EC%2595%258C%25EA%25B3%25A0%25EB%25A6%25AC%25EC%25A6%2598-%25EC%259C%2584%25ED%2581%25B4%25EB%25A6%25AC-%25EB%25B9%2584%25ED%2583%2580%25EC%2595%258C%25EA%25B3%25A0-%25EC%258B%259C%25EC%25A6%258C2-%25EC%259E%2585%25EB%25AC%25B8%25ED%258E%25B8

    [문제]
    최근 열심히 구슬을 수집하던 홍현이는 너무나도 비싼 구슬들을 많이 산 탓에 재정난에 시달리고 있었다.
    그래서 홍현이는 방학 동안 부업을 통해 소소하게 용돈을 벌어보고자 한다.
    홍현이가 선택할 수 있는 부업은 총 N개로 i 번째 부업은 시작 시간(s_i)과 끝나는 시간(e_i)으로 나타낼 수 있다.
    부업의 단가는 일의 걸리는 시간과는 무관하게 모두 똑같기 때문에 최대한 많은 일을 해야 많은 돈을 벌 수 있다.
    이때 홍현이가 할 수 있는 최대 부업의 개수를 구해보자!


    [입력]
    첫 번째 줄에는 부업의 개수 N이 주어진다. (2<= N <= 1,000,000)
    두 번째 줄부터 한 줄에 하나씩 부업의 시작 시간(s_i)과 끝나는 시간(e_i)이 공백으로 구분되어 주어진다.
    (1<=s_i < e_i < 1,000,000,000)
    ※ 한 부업의 끝나는 시간과 다른 부업의 시작 시간이 같은 경우, 부업이 끝나자마자 바로 다른 부업을 이어서 해나갈 수 있다.

    [출력]
    홍현이가 할 수 있는 최대 부업의 개수를 출력한다.
 
    [Primary idea] : 탐욕
    1. 다양한 해결책을 생각해본다.
        1) 시작 시간이 빠른 부업을 먼저 시작한다.   -> (x)
        2) 걸리는 시간이 짧은 부업을 먼저 시작한다.  -> (x)
        3) 끝나는 시간이 빠른 부업을 먼저 시작한다.  -> (o)
    2. STL 정렬을 통해 1-3)을 정렬한다
    3. i번째 부업이 마지막 부업이 끝난 시간보다 크거나 같다면 정답을 1증가 시키고, 부업이 끝난 시간을 갱신

    Time Complexity : O(n^2)
    Space Complexity : O(n^2)
 
    Created by gunhyeong on 2021/01/11.
*/

import Foundation

let n = Int(readLine()!)!
var kitchen = [(Int, Int)]() // c++의 pair & vector 대신

for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    kitchen.append((info.first!, info.last!))
}

kitchen.sort(by: {
    if $0.1 < $1.1 {
        return true
    } else if $0.1 > $1.1 {
        return false
    } else {
        if $0.0 < $1.0 {
            return true
        } else {
            return false
        }
    }
})

var e = 0, answer = 0
for i in 0..<n {
    if kitchen[i].0 >= e { // i번째 부업이 마지막 부업이 끝난 시간보다 크거나 같다면
        answer += 1
        e = kitchen[i].1 // 부업이 끝난 시간을 갱신
    }
}

print(answer)
