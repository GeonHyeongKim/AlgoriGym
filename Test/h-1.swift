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
    var answer = [Int](repeating: -1, count: phone_number.count)

    for (i,number) in phone_number.enumerated() {
        let removeChar = number.components(separatedBy: ["-", "+"])
        
        if number.starts(with: "010-") && removeChar.count == 3 { // 010XXXXXXXX
            let secondNum = removeChar[1].count
            let thirdNum = removeChar[2].count
            if secondNum == 4 && thirdNum == 4 { answer[i] = 1 } // 010-XXXX-XXXX
        } else if number.starts(with: "010"){
            if removeChar.map({$0.count}).reduce(0, +) == 11 { answer[i] = 2 }
        } else if number.starts(with: "+82-10-") && removeChar.count == 5 { // +82-10-XXXX-XXXX
            let secondNum = removeChar[3].count
            let thirdNum = removeChar[4].count
            if secondNum == 4 && thirdNum == 4 { answer[i] = 3 }
        } else {
            continue
        }
    }

    return answer
}

print(solution(["01012345678", "010-1212-333", "+82-10-3434-2323", "+82-010-3434-2323", "010-3333-3333", "010-0000"])) // [2, -1, 3, -1, 1, -1]
