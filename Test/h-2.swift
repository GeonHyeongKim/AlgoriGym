//
//  h-2.swift
//  Primary idea:       <String & Array>
//                      1. 여러 경우의 수를 생각하여 갯수를 세어줄 때만을 찾는다.
//                      2. 이메일의 이름 부분 : @로 나누엇을때, 2개로 쪼개어 지지 않을 경우를 제외하고 첫번째 것이 이름(name)이다.
//                      3. 이름이 아닌 부분 : @ 뒷 부분에서 "."으로 나누었을때 갯수가 2개가 아니면 다른 형태
//                      4. 2,3조건을 다 통과하고 @ 뒷부분중 마지막 요소가 topDomain! 이것이 미리 선언된 3가지 유형에 속해 있지 않을 경우 다른 형태
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

    for email in emails {
        let seperate = email.components(separatedBy: "@")

        let name = seperate.count != 2 ? nil : seperate.first!
        if name == nil { continue } // 두개의 배열로 나뉘어 지지 않을때

        let domains = seperate.last!.components(separatedBy: ".") // @의 뒷부분을 "."으로 분리
        if domains.count != 2 { continue } // 두개의 배열로 나뉘어 지지 않을때

        let topDomain = domains.last! // 탑 도메인 부분
        if !typeTopDomain.contains(topDomain) { continue } // 탑도메인이 3가지 유형에 속해있지 않을 경우

        answer += 1
    }

    return answer
}

print(solution(["d@co@m.com", "a@abc.com", "b@def.com", "c@ghi.net"])) // 3
print(solution(["abc.def@x.com", "abc", "abc@defx", "abc@defx.xyz"])) // 1
