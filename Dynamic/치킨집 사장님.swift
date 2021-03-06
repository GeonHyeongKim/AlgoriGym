/*
    치킨집 사장님.swift
    [Question Link] : 위클리 비타알고 시즌2 강의
    https://edu.goorm.io/lecture/15551/%25ED%2594%2584%25EB%25A6%25AC%25EB%25AF%25B8%25EC%2597%2584-%25EC%2595%258C%25EA%25B3%25A0%25EB%25A6%25AC%25EC%25A6%2598-%25EC%259C%2584%25ED%2581%25B4%25EB%25A6%25AC-%25EB%25B9%2584%25ED%2583%2580%25EC%2595%258C%25EA%25B3%25A0-%25EC%258B%259C%25EC%25A6%258C2-%25EC%259E%2585%25EB%25AC%25B8%25ED%258E%25B8

    [문제]
    코딩에 지친 홍현이에게 어느 날 놀라운 일이 발생했다.
    바로 달걀을 부화시켜 병아리를 만드는 데 하루, 병아리를 다 큰 닭으로 키워내는 데 하루가 걸리는 능력과 다 키워낸 닭에게 하루 한 개의 달걀을 얻어낼 수 있는 능력까지 얻게 된 것이다.
    이러한 능력에 감탄하며 자신의 능력의 한계를 시험해보기 위해 닭을 한 마리 사 왔다.

    예를 들어 3일 동안 이 능력을 이용해 닭을 길러낸다면

    첫 번째 날에는 사온 닭이 한 개의 달걀을 낳는다.
    두 번째 날에는 첫 번째 날에 사 온 닭이 낳은 달걀이 병아리가 되고, 닭이 하나의 달걀을 낳는다.
    세 번째 날에는 두 번째 날의 병아리가 닭이 되어 총 두 마리의 닭이 되고, 두 번째 날에 낳은 달걀이 병아리가 되며 두 마리의 닭이 각각 하나의 달걀을 낳는다.

    홍현이는 번째 날에 자신이 키워낸 닭의 수를 헤아려보고 싶지만 많은 수의 닭을 키워낼 수 있으리라 예상하고 이미 치킨집 개업을 준비하고 있기에 정신없이 바쁜 상황이다.
    홍현이를 도와 N번째 날에 홍현이가 몇 마리의 닭을 가지고 있을지 계산해주는 프로그램을 작성해보자.

    [입력]
    문제에서 설명한 N이 주어진다. ( 1<= N <= 1,000,000)

    [출력]
    N번째 날에 홍현이가 가지고 있는 닭의 수를 출력한다.
    답이 매우 커질 수 있으므로 답을 10^9+7로 나눈 나머지를 출력한다.
 
    [Primary idea] : 동적계획법, 나머지 연산자 성징
    1. 작은 문제를 큰 문제를 풀 수 있을 때까지 차례차례 풀어나가는 방법을 상향식 방법(Top-down)으로 해결
    2. 약 90번째 항부터 수가 매우 커져 나머지 연산자 성질을 이용
    
    Time Complexity : O(n)
    Space Complexity : O(n)

    Created by gunhyeong on 2021/01/4.
*/

import Foundation

let n = Int(readLine()!)!
let maxN = 1_000_001
var coop = [Int](repeating: 0, count: maxN)
var chicken = 0
coop[0] = 0
coop[1] = 1
coop[2] = 1
let mod = 1_000_000_000 + 7

for i in 3...n {
    coop[i] = coop[i-1] + coop[i-2]
    coop[i] %= mod
}

print(coop[n])
