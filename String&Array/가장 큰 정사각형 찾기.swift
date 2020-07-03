//
//  가장 큰 정사각형 찾기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12905
//  Primary idea:       <Dynamic Programming>
//                      1. DP(Dynamic Programming)를 이용
//                      2. 배열의 [1][1]부터 반복문을 돌린다. (첫 번째 행, 첫 번째 열 무시, 이유는 2번 참고)
//                      3. 현재 값이 1일 경우, 좌측값, 상단값, 좌측상단값 중 가장 작은 값의 +1 한 값을 현재 값으로 할당.
//                      4. 배열이 끝날 때 까지 반복.
//                      5. 배열의 가장 큰 값이 현재 배열의 가장 큰 정사각형의 값이 된다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/03.
//

import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var answer:Int = 0
    
    // [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
    print("Hello Swift")

    return answer
}
