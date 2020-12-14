
import Foundation

func solution(_ k:Int, _ score: [Int]) -> Int {
    var diffs: [Int] = [0]
    var record = [Int : Int]() // 차이값 : 누적횟수
    var result = [Bool](repeating: true, count: score.count)

    for i in 1..<score.count {
        let diff = (score[i] - score[i-1]) * -1
        diffs.append(diff)
        record[diff] = record[diff] == nil ? 1 : record[diff]! + 1
    }

    for num in record.filter({ $0.value >= k }).keys {
        for i in 1..<diffs.count {
            if diffs[i] == num {
                result[i-1] = false
                result[i] = false
            }
        }
    }

    return result.filter({$0}).count
}

print(solution(3, [24,22,20,10,5,3,2,1]))
