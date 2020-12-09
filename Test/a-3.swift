import Foundation

let n = Int(readLine()!)!
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
let INF = Int.max
var answer = 0

var maze = [[Int]]()
var dist = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: INF, count: 4), count: 101), count: 101)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    maze.append(input)
}

// dist[x][y][dirction]
dist[0][0][0] = 0
dist[0][0][1] = 0
dist[0][0][2] = 0
dist[0][0][3] = 0

//초기화
var queue = [Point]()
queue.append(Point(0, 0, 1, maze[0][0], 0))
queue.append(Point(0, 0, 1, maze[0][0], 1))
queue.append(Point(0, 0, 1, maze[0][0], 2))
queue.append(Point(0, 0, 1, maze[0][0], 3))

while !queue.isEmpty {
    let cur = queue.removeFirst()
    let x = cur.x
    let y = cur.y
    let cost = cur.cost
    let pavement = cur.pavement
    let dir = cur.direction
    
    for i in 0..<4 {
        let x = x + dx[dir]
        let y = y + dy[dir]
        
        if abs(dir - i) == 2 { continue }
        
        if x < 0 || y < 0 || x >= n || y >= n { continue }
        
        let nextCost = cost + 1
        
        if dist[x][y][i] > nextCost {
            dist[x][y][i] = nextCost
            let nextPavement = maze[x][y] == 1 ? pavement + 1 : pavement
            answer = max(answer, nextPavement)
            queue.append(Point(x, y, nextCost, nextPavement, i))
        }
    }
}

print(answer + maze[n-1][n-1])

struct Point {
    var x: Int
    var y: Int
    var cost: Int
    var pavement: Int
    var direction: Int
    
    init(_ x: Int, _ y: Int, _ cost: Int, _ pavement: Int, _ direction: Int) {
        self.x = x
        self.y = y
        self.cost = cost
        self.pavement = pavement
        self.direction = direction
    }
}
