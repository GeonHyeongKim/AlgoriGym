import Foundation

public func solution(_ S : inout [String]) -> [Int] {
    for (i, base) in S.enumerated() {
        for j in 0..<base.count {
            for (k, target) in S.enumerated() {
                if target == base { continue }
                let index = base.index(base.startIndex, offsetBy: j)
                if target[index] == base[index] { return [i, k, j] }
            }
        }
    }
    return []
}


var S = ["abc", "bca", "dbe"]
print(solution(&S))
