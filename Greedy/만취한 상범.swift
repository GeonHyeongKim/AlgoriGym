/*
*  만취한 상범.swift
*  Question Link: https://www.acmicpc.net/problem/6359
*  Primary idea:   <Greedy>
*                  1. 방 생성 : 입력 받은 방의 크기(n) 만큼 배열을 선언
*                  2. 열고 닫음 : 2중 for문으로 1의 배수 -> 2의 배수 -> ... 만큼 등비수열 값이 입력받은 방의 수보다 작을 경우 값을 switch한다.
*                  3. 결과 : filter를 통해 결과가 true인 값들만 count해서 출력
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/04/19.
*/

import Foundation

var testCase = Int(readLine()!)! // Test Case 갯수

for _ in 1...testCase {
    let n = Int(readLine()!)!
    var room = [Bool](repeating: false, count: n+1) // 1. 방 생성
    
    for i in 1...n {
        for j in 1...100 {
            let cal = i * j
            
            if n >= cal { // 2. 열고 닫음
                room[cal] = !room[cal]
            }
        }
    }

    print(room.filter({$0 == true}).count) // 2. 결과
}
