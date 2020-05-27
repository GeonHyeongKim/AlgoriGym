//
//  병든 나이트.swift
//  Question Link: https://www.acmicpc.net/problem/1783
//  Primary idea:       <Greedy>
//                      1) 나이트의 행동 분석
//                         i) 시작 위치 : 가장 왼쪽아래
//                         ii) 이동 횟수가 4번 이상인 경우 '반드시 6칸 오른쪽'으로 이동해야함
//                         iii) 이동 횟수가 4번 미만이면 '같은 움직임'을 해도 됌
//                      2) N과 M에 의한 정답
//                         i) N = 1일 때, 제자리 이기 때문에 1번 움직임
//                         ii) N = 2일 때, M = 1,2 -> 1
//                                        M = 3,4 -> 2
//                                        M = 5,6 -> 3
//                                        M = 7,8 -> 4
//                                        M >= 9  -> 4, 최대 움직임 4
//                         iii) N > 3일떄, M = 1 -> 1
//                                        M = 2 -> 2
//                                        M = 3 -> 3, 최대 움직임 M
//                                        M = 4 -> 4
//                                        M = 5 -> 4
//                                        M = 6 -> 4, 최대 움직임 4를 넘을 수 없다.
//                                        M = 7 -> 5, M - 2
//                                        M = 8 -> 6
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/05/26.
//

import Foundation

guard let input = readLine()?.split(separator: " ").map({Int($0)!}) else { // 입력 받는 형식(readLine()의 ?와, fatalError() 주의)
    fatalError()
}

let n = input[0] // 세로
let m = input[1] // 가로

if n == 1 {
    print("1") // 나이트는 이동할 수 없음
} else if n == 2 {
    print(min((m+1)/2, 4)) // 높이가 2인 경우 위로1칸 오른쪽 2칸, 밑으로 1칸 오른쪽 2칸 으로만 이동, 최대 4까지 가능
} else { // n > 3
    if m <= 6 {
        print(min(m, 4))
    } else {
        print(m-2)
    }
}
