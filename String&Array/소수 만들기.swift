//
//  소수 만들기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12977
//  Primary idea:       <String & Array>
//                      1. nums의 길이가 3~50개 임으로, 3중 반복문을 통해 모든 경우의 수를 구한다.
//                      2. 반복문의 첫번쨰 + 두번째 + 세번째 Index값들을 더해 소수인지 판단한다.
//                      3. isPrime(Int:)를 통해 소수인지 아닌지를 판단후, 맞을 경우 1개씩 증가시킨다.
//
//  Time Complexity : O(n^3)
//  Space Complexity : O(1)
//  Runtime: 0.17 ~ 1362.17 ms
//  Memory Usage: 23.7 ~ 24.3 MB
//
//  Created by gunhyeong on 2020/07/07.
//

import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    
    for first in 0..<nums.count {
        for second in first+1..<nums.count {
            for third in second+1..<nums.count {
                let sum = nums[first] + nums[second] + nums[third]
                if isPrime(sum) {
                    answer += 1
                }
            }
        }
    }

    return answer
}

// 소수 인지 판별
func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}

print(solution([1,2,3,4])) // 1
print(solution([1,2,7,6,4])) // 4
