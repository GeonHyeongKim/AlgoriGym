import Foundation
public func solution(_ S : inout String) -> Int {
    guard !S.contains("aaa") else { return -1 }
    var answer = 0
    var cntA = 0

    for char in S {
        if char == "a" {
            cntA += 1
        } else {
            answer += 2 - cntA
            cntA = 0
        }
    }

    return S.last! != "a" ? answer + 2 : answer
}


var S = "aa"
print(solution(&S))
