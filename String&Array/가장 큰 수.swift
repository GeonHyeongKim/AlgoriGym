//
//  가장 큰 수.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42746?language=swift
//  Primary idea:       <String & Array> - sorted
//                      [문자열로 합쳐 비교하여 재배치]
//                      1. 주어진 numbers 배열을 정렬한다. 정렬 방식은 다음과 같다.
//                          i) 첫 번째 정수값($0)과 두 번째 정수값($1)을 String으로 변환시킨다음 두 String을 붙여 하나의 문자열을 만들어 낸다.
//                          ii) 첫 번째 정수값을 먼저 배치한 경우와 두 번째 정수값을 먼저 배치한 경우 중 Int로 변환했을 때 어느 값이 더 큰지 비교하여 정렬한다.
//                              예를 들어 0과 9 값이 있다면 "09" 와 "90"을 만들어 Int 로 변환한 뒤 값을 비교한다. 9와 90 중 90이 더 크기 때문에 0이 9의 뒤로 정렬되게 된다.
//                      2. 정렬된 배열의 첫 번째 값이 0인지 확인하여 0 일 경우 "0"을 출력한다.
//                          정렬한 첫 번째 값이 0이라는 것은 모든 배열의 값이 0 일 경우를 의미하게 된다. [0,0,0,0] 이 주어졌을 때 그대로 값을 붙여서 return 하면 "0"이 아니라 "0000" 이 출력되기 때문에 올바르지 않게 된다.
//                      3. 정렬된 배열의 값을 하나씩 꺼내서 하나의 문자열로 합친(reduce) 결과값을 반환한다.
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/05/29.
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    return ""
}
