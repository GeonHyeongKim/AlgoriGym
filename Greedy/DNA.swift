/*
*  DNA.swift
*  Question Link: https://www.acmicpc.net/problem/1969
*  Primary idea:    <Greedy == Brute force>
*                    1. Cache 배열에 각 인덱스당 A, C, G, T가 몇 개 사용되었는지 기록합니다.
                        ->A, C, G, T 순으로 저장하는 이유는 사전순에서 제일 빠른 단어를 출력하기 위해서입니다.
*                    2. 반복문을 돌리면서 제일 많이 쓰인 알파벳을 출력하고 Hamming Distance를 계산합니다.
*                    3. 마지막에 Hamming Distance의 누적합을 출력해주면 됩니다.
*
*  Time Complexity : O(N*M) ~ O(N)
*  Space Complexity : O(1)
*  Runtime: 64.192 ms
*  Memory Usage: 28
*
*  Created by gunhyeong on 2020/05/02.
*/

import Foundation

var nucleotide: [Character:Int]
var input = readLine()!.split(separator: " ")
var n = Int(input[0])!
var lineCnt = Int(input[1])!
var DNAList = [String]()

for _ in 1...n { // n 갯수 만큼 입력
    let dna = readLine()!
    DNAList.append(dna)
}

var result = ""
var count = 0
var index = result.startIndex

for i in 0..<lineCnt {
    nucleotide = ["A":0, "C":0, "G":0, "T":0] // 초기화
    
    for DNA in DNAList {
        index = DNA.index(DNA.startIndex, offsetBy: i)
        nucleotide[DNA[index]]! += 1
    }
    
    let subDNA = String(nucleotide.max {a, b in
        if a.value < b.value {
            return true
        } else if a.value == b.value { // 값이 같을 경우
            if a.key < b.key { // key(알파벳)의 오름차순
                return false
            }
            return true
        }
        return false
        }!.key)
    
    result += subDNA
    count += (n - nucleotide.values.max()!) // DNA의 총 갯수 - 가장 많은 알파벳의 개수
    
}

print(result)
print(count)
