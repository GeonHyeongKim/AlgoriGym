//
//  Letter Tile Possibilities.swift
//  Question Link: https://leetcode.com/problems/letter-tile-possibilities/
//  Primary idea:   <BackTracking>
//                  1. 기본적으로 시간과 분을 함수로 파라미터로 보낸 뒤 계수를 반환한다.
//                  2. 결과에 포함되는 조건
//                  3. 탈출 조건 (계산하는 string의 총 길이와 탐색하고 있는 index의 값이 일치할떄)

//  Time Complexity :
//  Space Complexity :
//
//  Created by gunhyeong on 2020/02/27.
//

import Foundation

class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        guard tiles.count >= 0 && tiles.count <= 7 else {
            return 0
        }
        
        var result = Set<String>()
        var tiles = Array(tiles)
               
        backtracking(&tiles, &result, 0)
        return result.count
    }
    
    func backtracking(_ tiles: inout Array<Character>, _ result: inout Set<String>, _ currentLength: Int){
        if currentLength > 0 { // 결과에 포합되는 조건
            let str = String(tiles[0..<currentLength])
            result.insert(str)
        }
        
        if currentLength == tiles.count {
            return
        }
        
        for index in currentLength..<tiles.count {
            tiles.swapAt(currentLength, index)
            backtracking(&tiles, &result, currentLength + 1)
            tiles.swapAt(currentLength, index)
        }
    }
}
