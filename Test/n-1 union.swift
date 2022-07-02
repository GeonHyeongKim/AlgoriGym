//
//  main.swift
//  Algorithm
//
//  Created by gunhyeong on 2019/12/30.
//  Copyright © 2019 geonhyeong. All rights reserved.
//

import Foundation

var tree = [Int]()
var result = 0

var A = [Int]()
A = [1, 3, 4, 2, 5]

private func find(tree: inout [Int], num: Int) -> Int {
    if tree[num] == -1 {
        return num
    }
    tree[num] = find(tree: &tree, num: tree[num])
    return tree[num]
}

private func union(tree: inout [Int], a: Int, b:Int){
    let a = find(tree: &tree, num: a)
    let b = find(tree: &tree, num: b)

    if a != b {
        tree[a] = b
    }
}

tree = [Int](repeating: -1, count: A.count + 1)
var B = [Int](repeating: -1, count: A.count + 1)

for i in 0...A.count - 1{
    B[i+1] = A[i]
}


for i in 1...A.count {
    if find(tree: &tree, num: B[i]) == 0 {
        continue
    }

    union(tree: &tree, a: B[i], b: B[i] - 1)

    if find(tree: &tree, num: B[i]) == 0 {
        result += 1
    }
}

print(result)



