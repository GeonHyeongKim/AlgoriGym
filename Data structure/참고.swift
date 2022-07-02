  참고.swift
MARK:- enumerated()
  for (index, value) in arr.enumerated()
        
MARK:- components(separatedBy: )
let removeChar = number.components(separatedBy: ["-", "+"])
        
MARK:- replacingOccurrences(of: "10", with: ""))
MARK:- mapValues{}, sorted(by: {$0 < $1}), map{$0}
var dic = [String:[Int]]()
let sortedDicByValue = dic.mapValues{$0.sorted(by:>)} // Dictionary의 value값을 오름차순으로 정렬 : 장르 내에서 많이 재생된 노래를 먼저 수록
let sortedDicBykeys = sortedDicByValue.sorted(by: {$0.value.reduce(0, +) > $1.value.reduce(0, +)}).map{$0.key} // 속한 노래가 많이 재생된(reduce로 판별) 장르를 먼저 수록
print(String("1011").replacingOccurrences(of: "10", with: "")) // 1011 -> 11

MARK:- mapValues{}, sorted(by: {$0 < $1}), filter({})
func solution(_ arr:[Int]) -> [Int] {
    var map = [Int:Int]() // 종류:갯수
    for number in arr {
        if map.keys.contains(number) { map[number]! += 1} else { map[number] = 1 }
    }
    let result = map.sorted(by: {$0.key < $1.key}).filter({$0.value != 1}).map {$0.value}
    return result.count > 0 ? result : [-1]
}

print(solution([1, 2, 3, 3, 3, 3, 4, 4])) // [4, 2]

MARK:- filter({})
MARK:- starts(with:)
if String("String").starts(with: "str") { print(true) }

MARK:- stride(from: 0, through: 0, by: -1)       stride (from: 0, to: 0, by: -1)
for i in stride(from: 0, through: 0, by: -1) {}

MARK:- 다중 정렬 : sorted(by: {}
    let sort = failureRateListByStage.sorted(by: { // 2. 다중 정렬 - lambda
        if ($0.1 == $1.1) {
            return ($0.0 < $1.0)
        }
        return ($0.1 > $1.1)
    })
                      
MARK:- string.index(after:      string.index(before:          .index(string.startIndex, offsetBy: 2)
let start = string.index(after: string.startIndex)
let end = string.index(before: string.endIndex)
let substring = string[start..<end]  // "bc12
let thirdIndex = string.index(string.startIndex, offsetBy: 2)
                                             
MARK:- split(separator: Character)         str.split(separator: " ", maxSplits: 1)
var str = "Hello, world. Zedd!!   Haha"
str.characters.split(separator: " ").map(String.init)
