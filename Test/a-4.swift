import Foundation

let n = Int(readLine()!)!
var nList = readLine()!.split(separator: " ").map{Int($0)!}
nList.sort(by: >)
var minValue = 100
var answer = [Int]()

for i in 0..<nList.count {
    var siblings = [Int](repeating: 0, count: 3)
    let temp = nList
    let temp1 = temp[0..<i]
    let temp2 = temp[i..<nList.count]
    let temp3 = Array(temp2 + temp1)
    
    for volume in temp3 {
        let index = nextPerson(siblings)
        siblings[index] += volume
    }
    
    if !checkConstrains(siblings) { continue }
       
    let diff = siblings.first! - siblings.last!
    if minValue > diff {
        minValue = diff
        answer = siblings
    }
}

for person in answer {
    print("\(person)", terminator: " ")
}

func nextPerson(_ siblings: [Int]) -> Int {
    return siblings.firstIndex(of: siblings.min()!)!
}

func checkConstrains(_ siblings: [Int]) -> Bool {
    for i in 0...1 {
        if siblings[i] < siblings[i+1] { return false }
    }
    
    return true
}
