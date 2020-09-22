//
//  스택 수열.swift
//  Question Link: https://www.acmicpc.net/problem/1874
//  Primary idea:       (String & Array & Stack)
//                      1. 1~n까지 탐색하는 숫자(count)를 변수로 지정
//                      2. 1~n까지 반복할 때마다 값을 입력(data)받음
//                      3. 입력받은 수(data) 보다 작거나 같은때까지 반복
//                          i)  [Int]형 배열(stack)에 저장
//                          ii) count를 증가
//                          iii) 결과값(result)에 "+" 저장
//                      4. 3번이 끝난 뒤, stack의 마지막 값이 입력받은 값과 같다면
//                          i)  stack에서 마지막값 제거
//                          ii) 결과값(result)에 "-" 저장
//                      5. 4번이 아닐 경우, "NO" 출력
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/21.
//

import Foundation

let n = Int(readLine()!)!
var list = [Int]()
var stack = [Int]()
var count = 1
var answer = [String]()
var isNo = false

for _ in 1...n {
    let data = Int(readLine()!)!
    while count <= data {
        stack.append(count)
        count += 1
        answer.append("+")
    }
    
    if stack.last! == data {
        stack.removeLast()
        answer.append("-")
    } else {
        isNo = true
        break
    }
}

if !isNo {
    for c in answer {
        print(c)
    }
} else {
    print("NO")
}
