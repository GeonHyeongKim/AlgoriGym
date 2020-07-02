//
//  h-1.swift
//  Primary idea:       <String & Array>
//                      1. 문자를 다 제거한다.
//                      2. 숫자만 남은 number에서 첫번째 배열값이 1개면서 그 배열값의 길이가 11개 이면 2유형 // 010XXXXXXXX
//                      3. 첫번재 배열값이 3개이면서 나머지 배열값의 길이가 4개일 경우 1유형 // 010-XXXX-XXXX
//                      4. "", "82", "10"으로 시작하면서 나머지 배열값의 길이가 4개일 경우 3유형 // +82-10-XXXX-XXXX
//
//  Time Complexity :
//  Space Complexity :
//
//  Created by gunhyeong on 2020/07/02.
//

import Foundation

func solution(_ phone_number: [String]) -> [Int] {
    var answer = [Int](repeating: 0, count: phone_number.count)

    for (i,number) in phone_number.enumerated() {
        let removeChar = number.components(separatedBy: ["-", "+"])
        let firstNumber = removeChar.first!

        if removeChar.count == 1 { // 010XXXXXXXX
            if firstNumber.count == 11 {
                answer[i] = 2
                continue
            }
        } else if firstNumber == "010" { // 010-XXXX-XXXX
            if removeChar[1].count == 4 && removeChar[2].count == 4 {
                answer[i] = 1
                continue
            }
        } else if removeChar[1] == "82" && removeChar[2] == "10" { // +82-10-XXXX-XXXX
            if removeChar[3].count == 4 && removeChar[4].count == 4 {
                answer[i] = 3
                continue
            }
        }

        answer[i] = -1
    }

    return answer
}


print(solution(["01012345678", "010-1212-333", "+82-10-3434-2323", "+82-010-3434-2323"])) // [2, -1, 3, -1]
