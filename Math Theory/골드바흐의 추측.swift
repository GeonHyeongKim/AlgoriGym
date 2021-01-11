/*
    골드바흐의 추측.swift
    [Question Link] : 위클리 비타알고 시즌2 강의
    https://edu.goorm.io/lecture/15551/%25ED%2594%2584%25EB%25A6%25AC%25EB%25AF%25B8%25EC%2597%2584-%25EC%2595%258C%25EA%25B3%25A0%25EB%25A6%25AC%25EC%25A6%2598-%25EC%259C%2584%25ED%2581%25B4%25EB%25A6%25AC-%25EB%25B9%2584%25ED%2583%2580%25EC%2595%258C%25EA%25B3%25A0-%25EC%258B%259C%25EC%25A6%258C2-%25EC%259E%2585%25EB%25AC%25B8%25ED%258E%25B8

    [문제]
    골드바흐의 추측은 오래 전부터 알려진 정수론의 미해결 문제로, 2보다 큰 모든 짝수는 두 개의 소수의 합으로 표시할 수 있다는 것이다.
    비록 아직 이 문제는 해결되지 않았지만 많은 수학자들에 의해 대부분의 짝수는 두 소수의 합으로 표현 가능함이 증명되었다.
    골드바흐의 추측이 참인지 확인하기 위해 주어진 수를 두 소수의 합으로 표현해보자!

    [입력]
    첫 번째 줄에는 수의 개수 N이 주어진다. (1<=N<=1,000)
    두 번째 줄부터 N+1번째 줄까지 수 a_i가 주어진다. (4 <= a_i <= 1,000,000)
    단, a_i는 짝수이다.

    [출력]
    주어진 수를 두 소수의 합으로 표현한 수를 출력한다.
    만약 답이 하나가 아니라면 두 수의 차가 가장 작은 수를 출력하고, 작은 수를 먼저 출력한다
 
    [Primary idea] : 수학적 사고와 공식 활용 (소수 판별법)
    1. 에라토스테네스의 체를 통해 미리 소수를 구한 다음, 소수만을 이용하여 합이 인지를 판단하는 방법이 가장 효율적

    Time Complexity : O(1)
    Space Complexity : O(1)
 
    Created by gunhyeong on 2021/01/12.
*/

import Foundation

let prime = Eratosthenes(1_000_000)

for _ in 0..<Int(readLine()!)! {
    let num = Int(readLine()!)!
    var one = 0, other = 0
    var l = 0, r = prime.count - 1
    
    while l <= r {
        let sum = prime[l] + prime[r]
        if sum == num {
            one = prime[l]
            other = prime[r]
            l += 1
            r -= 1
        } else if sum < num {
            l += 1
        } else {
            r -= 1
        }
    }
    print("\(one) \(other)")
}

// 에라토스테네스의 체
func Eratosthenes(_ n: Int) -> [Int] {
    var array = [Bool](repeating: false, count: n+1)
    var prime = [Int]()

    for i in 2...n {
        if !array[i] {
            prime.append(i)
            for j in stride(from: i, through: n, by: i) {
               array[j] = true
            }
        }
    }
    
    return prime
}
