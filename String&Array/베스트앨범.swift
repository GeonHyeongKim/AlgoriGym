//
//  베스트앨범.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42579
//  Primary idea:       <String & Array> - Hash
//                      1. 종류별 노래 리스트를 Dictionary에 저장한다.
//                      2. Dictionary에서 종류에 따른 노래 리스트를 오름차순으로 정렬한다.
//                      3. 정렬 후, 각 노래리스트의 플레이수를 합친값이 큰 종류순으로 정렬하여 종류 리스트를 알아낸다.
//                      4. 정렬된 종류 리스트를 반복문으로 돌면서 play에서 해당 index값을 결과에 넣는다. 이때, 두개씩만 넣기 위해 카운트 변수를 둔다
//
//  Time Complexity : O(n*m), n : genres 수, m : plays 수
//  Space Complexity : O(n*m)
//  Runtime: 0.38 ~ 0.81 ms
//  Memory Usage: 24.1 ~ 24.4 MB
//
//  Created by gunhyeong on 2020/06/30.
//

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var plays = plays
    var dic = [String:[Int]]()
    var result = [Int]() // 결과
    
    // Dictionary에 종류(genres)별 노래(play)를 저장
    for (i, genre) in genres.enumerated() {
        if dic.keys.contains(genre) {
            dic[genre]!.append(plays[i])
        } else {
            dic[genre] = [plays[i]]
        }
    }
    
    let sortedDicByValue = dic.mapValues{$0.sorted(by:>)} // Dictionary의 value값을 오름차순으로 정렬 : 장르 내에서 많이 재생된 노래를 먼저 수록
    let sortedDicBykeys = sortedDicByValue.sorted(by: {$0.value.reduce(0, +) > $1.value.reduce(0, +)}).map{$0.key} // 속한 노래가 많이 재생된(reduce로 판별) 장르를 먼저 수록
    
    for genre in sortedDicBykeys {
        var cnt = 0
        for value in sortedDicByValue[genre]! {
            if cnt == 2 { // 두 개씩 모아 베스트 앨범을 출시
                continue
            }
            
            let index = plays.firstIndex(of: value)!
            result.append(index)
            plays[index] = 0 // 중복값이 있을 경우, firstIndex는 같은 값을 출력
            cnt += 1
        }
    }
    return result
}

print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]))
