//
//  h-2.swift
//  Primary idea:       <String & Array>
//                      1. 여러 경우의 수를 생각하여 갯수를 세어줄 때만을 찾는다.
//                      2. 이메일의 이름 부분 : @로 나누엇을때, 2개로 쪼개어 지지 않을 경우를 제외하고 첫번째 것이 이름(name)이다.
//                      3. 이름이 아닌 부분 : @ 뒷 부분에서 "."으로 나누었을때 갯수가 2개가 아니면 다른 형태
//                      4. 2,3조건을 다 통과하고 @ 뒷부분중 마지막 요소가 topDomain! 이것이 미리 선언된 3가지 유형에 속해 있지 않을 경우 다른 형태
//                      5. 이때 각 문자열은 영문 소문자 이여야 하기 떄문에 반복문을 통해 각 문자를 검사한다.
//
//  Time Complexity :
//  Space Complexity :
//
//  Created by gunhyeong on 2020/07/02.
//

import Foundation

func solution(_ emails: [String]) -> Int {
    let typeTopDomain = ["com", "net", "org"]
    var answer = 0


    return answer
}

func isLowercase(_ str: String) -> Bool {
    for char in str {
        if !char.isLowercase {
            return false
        }
    }
    
    return true
}


print(solution(["d@co@m.com", "a@abc.com", "b@def.com", "c@ghi.net"])) // 3
print(solution(["abc.def@x.com", "abc", "abc@defx", "abc@defx.xyz"])) // 1
