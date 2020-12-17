import Foundation

public func solution(_ A : inout [Int]) -> Int {
    var sortedAByAsc = A.sorted()
    var answer = 0
    var insertIndexMax = 0
    var max = 0

    for i in 1..<sortedAByAsc.count {
        let base = sortedAByAsc[i-1]
        let target = sortedAByAsc[i]
        insertIndexMax = i

        if base == target {
            if check(sortedAByAsc, i) {
                while true {
                    if insertIndexMax == sortedAByAsc.count - 1{
                        max = sortedAByAsc.last! + 1
                        sortedAByAsc.append(max)
                        answer += max - target
                        sortedAByAsc.remove(at: i)
                        break
                    }

                    if sortedAByAsc[insertIndexMax] == sortedAByAsc[insertIndexMax+1] {
                        insertIndexMax += 1
                        continue
                    }

                    if sortedAByAsc[insertIndexMax] + 1 == sortedAByAsc[insertIndexMax+1] {
                        insertIndexMax += 1
                        continue
                    }

                    if sortedAByAsc[insertIndexMax] + 1 != sortedAByAsc[insertIndexMax + 1] {
                        max = sortedAByAsc[insertIndexMax + 1]
                        sortedAByAsc.insert(max, at: insertIndexMax + 1)
                        answer += max - target
                        sortedAByAsc.remove(at: i)
                        break
                    }


                }
            } else {
                while true {
                    answer += 1
                    sortedAByAsc[i] = target - 1
                    break
                }
            }
        }
    }

    return answer
}

func check(_ sortedAByAsc: [Int], _ i: Int) -> Bool {
    return sortedAByAsc.count - i > i ? true : false
}

//var S = [1, 2, 1]
//var S = [2, 1, 4, 4]
//var S = [6, 2, 3, 5, 6, 3]
//var S = [1,1,1,1,1,10,10,10,10,10]
var S = [2, 2, 2, 2]

print(solution(&S))

