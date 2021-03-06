/*
    특등사수.swift
    [Question Link] : 위클리 비타알고 시즌2 강의
    https://edu.goorm.io/lecture/15551/%25ED%2594%2584%25EB%25A6%25AC%25EB%25AF%25B8%25EC%2597%2584-%25EC%2595%258C%25EA%25B3%25A0%25EB%25A6%25AC%25EC%25A6%2598-%25EC%259C%2584%25ED%2581%25B4%25EB%25A6%25AC-%25EB%25B9%2584%25ED%2583%2580%25EC%2595%258C%25EA%25B3%25A0-%25EC%258B%259C%25EC%25A6%258C2-%25EC%259E%2585%25EB%25AC%25B8%25ED%258E%25B8

    [문제]
    특등사수는 사격훈련에서 기록사격 시 20발 중 18발 이상을 표적에 적중한 사람을 뜻하는 말이다. 대한민국 육군 하사로 만기 전역을 한 홍현이는 특등사수이다.
    아직도 군 복무 시절을 잊지 못하는 홍현이는 때때로 군 복무 시절의 꿈을 꾸게 되었고, 요 근래에는 사격훈련 하는 꿈을 자주 꾸고 있다.
    꿈 속에서의 사격훈련은 좌표평면으로 나타낼 수 있는 넓은 평원에서 실시한다.
    홍현이는 원점에 서 있으며 좌표평면의 x, y 값이 정수인 모든 지점에 표적이 놓여있다. 주기적으로 훈련 통제소에서 좌표를 알려주면 사수는 해당 좌표에 있는 표적을 맞혀야만 한다.
    특등사수로써의 자부심을 가지고 있는 홍현이는 어떠한 표적이든 자신이 있는 위치에서 다른 표적에 가려지지 않는다면 무조건 맞출 수 있다고 생각한다.
    여기서 다른 표적에 가려지지 않는다는 뜻은 원점에서 해당 표적까지 선분을 그렸을 때 표적과 원점을 제외한 다른 표적이 선분에 포함되지 않는다는 것을 뜻한다.
    제법 긴 시간 동안 꿈을 꾼 홍현이는 도중에 꿈에서 깨버렸기 탓에 자신이 총 몇 개의 표적을 맞혔는지 매우 궁금해졌다.
    비록 결과는 모른 채 꿈에서 깨어났지만, 다행히 훈련 통제소에서 알려줬던 모든 표적의 좌표를 기억하고 있어 사격 결과를 계산해보려고 한다. 홍현이의 사격 결과를 구해보자!

    [입력]
    첫 번째 줄에는 홍현이의 사격 횟수 N이 주어진다. (1<=N<=10,000)
    두 번째 줄부터 N+1번째 줄 까지 표적의 좌표(x, y)가 공백으로 구분되어 주어진다.
    (-10^-18 <= x, y <= 10^18)
    단 입력으로 원점은 주어지지 않는다

    [출력]
    주어진 표적 중 홍현이가 맞힌 표적의 개수를 출력한다.
 
    [Primary idea] : 수학적 사고 이용(최대 공약수)
    1. 최대 공약수 이용
    2. 원점에서 해당 표적까지 선분을 그렸을 때 표적과 원점을 제외한 다른 정수 좌표가 선분에 포함되지 않으면 해당 표적을 원점에서 맞힐 수 있다
    * 주의 사항 : 더 큰 수가 0일 경우, runtime error가 뜬다.

    Time Complexity : O(n^m)
    Space Complexity : O(1)
 
    Created by gunhyeong on 2021/01/12.
*/

import Foundation

let n = Int(readLine()!)! // 사격 횟수
var ans = 0

for _ in 0..<n {
    let pos = readLine()!.split(separator: " ").map{Int($0)!}
    if GCD(abs(pos.first!), abs(pos.last!)) == 1 {
        ans += 1
    }
}

print(ans)

func GCD(_ min: Int, _ max: Int) -> Int {
    if max == 0 { return min }
    return min % max == 0 ? max : GCD(max, min % max)
}
