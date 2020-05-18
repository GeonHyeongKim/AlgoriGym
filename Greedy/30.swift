//
//  30.swift
//  Question Link: https://www.acmicpc.net/problem/10610
//  Primary idea:       <Greedy>
//                      1. 30의 배수가 되려면 마지막 숫자는 무조건 0이 나와야 한다.
//                      2. 마지막 숫자를 제외한 나머지 숫자는 3의 배수이며, 3의 배수는 모든 자리의 숫자의 합이 3의 배수이다.
//                         (이때 숫자의 순서는 상관없기 때문에 큰 순서대로 출력해주면 된다.)
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/05/17.
//

import Foundation

var N = readLine()!
var sum = 0

for num in N {
    sum += num.wholeNumberValue! // 각자리 합
}

if !N.contains("0") || sum % 3 != 0 { // 아이디어 1,2
    print(-1)
} else {
    print(String(N.sorted(by: >))) // 정렬 : 내림차순
}

