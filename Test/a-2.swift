let input = readLine()!.split(separator: " ").map{Int($0)!}
var answer = 0

for num in input.first!...input.last! {
    var num = num
    var sum = 1
    
    while num > 0 {
        let na = num % 10
        num /= 10
        sum *= na
    }
    
    answer += sum
}

print(answer)
