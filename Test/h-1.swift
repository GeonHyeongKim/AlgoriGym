//
//  h-1.swift
//  Primary idea:       <String & Array>
//                      1. 문자를 다 제거한다.
//                      2. 첫번재 배열값이 3개이면서 "010-"으로 시작, 두번째 세번째 길이가 각각 4인경우 : 1유형 // 010-XXXX-XXXX
//                      3. 1유형이 아닌것 중, 길이가 11인경우 : 2유형 // 010XXXXXXXX
//                      4. 첫번재 배열값이 5개이면서 "+82-10-"으로 시작, 두번째 세번째 길이가 각각 4인경우 : 3유형 // +82-10-XXXX-XXXX
//
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//
//  Created by gunhyeong on 2020/07/02.
//

import Foundation

func solution(_ phone_number: [String]) -> [Int] {
    var answer = [Int](repeating: -1, count: phone_number.count)


    return answer
}

print(solution(["01012345678", "010-1212-333", "+82-10-3434-2323", "+82-010-3434-2323", "010-3333-3333", "010-0000"])) // [2, -1, 3, -1, 1, -1]
