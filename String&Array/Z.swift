//
//  Z.swift
//  Question Link: https://www.acmicpc.net/problem/1074
//  Primary idea:       (분할 정복 && 재귀)
//                      1. n을 통해 pow를 쓰지 않고 2의 제곱을 구한다. (1>>n)
//                      2. z()함수 : 사각형의 왼쪽 상단의 꼭지점의 좌표와 한변의 길이를 밴개변수로 받는다.
//                         i) 온쪽 상단의 꼭지점 : x, y
//                         ii) 한변의 길이, 즉 size
//                      3. 종료 조건은 한 변의 길이가 1이 됐을 경우, cnt를 증가시키고 false를 반환
//                      4. x, y가 r, c가 되었을 경우 true
//                      5. 2중 포문으로 4번 호출해주는 것과 동일하게 계산한다. ( r+i*m, c+j*m )
//                         i) getAnswer(r, c, m);
//                         ii) getAnswer(r, c+m, m);
//                         iii) getAnswer(r+m, c, m);
//                         iv) getAnswer(r+m, c+m, m);
//
//  Time Complexity : O(1)
//  Space Complexity : O(n)
//  Runtime: 16 ms
//  Memory Usage: 81.332 MB
//
//  Created by gunhyeong on 2020/09/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0] // size
let r = input[1] // x
let c = input[2] // y
var size = Int(pow(Double(2), Double(n)))
var cnt = 0
var answer = 0

z(size, 0, 0)
print(answer)

// 0,0읗 기준으로 X,Y의 숫자
func z(_ size: Int, _ x: Int, _ y: Int) -> Bool {
    if size == 1 {
        if x == r && y == c {
            answer = cnt
            return true
        }
        cnt += 1
        return false
    }
    
    if !(x<=r && r<x+size && y<=c && c<y+size) {
        cnt += size * size
        return false
    }
    
    let m = size / 2
    
    for i in 0..<2 {
        for j in 0..<2 {
            if z(m, x+i*m, y+j*m) { return true }
        }
    }
    return false
}
