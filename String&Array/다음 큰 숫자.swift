//
//  다음 큰 숫자.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12911
//  Primary idea:       <String & Array>
//                      1. 10진수인 n을 2진수로 바꿔준다
//                      2. 1의 갯수를 센다
//                      3. 반복문으로 n+1 ~ 1,000,001까지 반복하면서 결과 값이 나올때까지 반복한다.
//                      4. 반복문의 변수를 2진수로 바꾸엇을때 1의 갯수를 세고 n의 2진수로 바꾸엇을때의 갯수와 같은지 비교한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/05.
//

import Foundation

func solution(_ n:Int) -> Int
{
    let binary = String(n, radix: 2)
    let cntBinary = binary.filter({$0 == "1"}).count
    
    for i in n+1...1000001 {
        if String(i, radix: 2).filter({$0 == "1"}).count == cntBinary {
            return i
        }
    }
    
    return 0
}

print(solution(78)) // 83
print(solution(15)) // 23
