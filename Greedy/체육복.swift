//
//  체육복.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42862
//  Primary idea:       <Greedy>
//                      1) 전체 학생 수 만큼의 Bool 배열(students)을 만든다
//                      2) lost 배열의 값을하나씩 꺼내어 해당 student를 false로 만든다. 단, reserve와 값이 같은 것이 있다면 reserve 값을 제거하고 continue
//                      3) 전체 학생 수를 반복하면서 false일때, 왼쪽과 오른쪽에 대한 reserve값이 나아있는 지 확인 후 true로 바꾸고 reserve에서 값 제거
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/05/27.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var reserve = reserve
    var students = [Bool](repeating: true, count: n+1) // index번호와 학생 번호를 맞추기
    
    for student in lost {
        if reserve.contains(student) {
            reserve.remove(at: reserve.firstIndex(of: student)!)
            continue
        }
        students[student] = false
    }
    
    for (i, check) in students.enumerated() {
        if !check {
            if reserve.contains(i-1) { // 자신보다 번호가 작은 사람 중 reseve에 남아 있는 경우
                students[i] = true
                reserve.remove(at: reserve.firstIndex(of: i-1)!) // 헤딩 reserve 제거
                continue
            }
            
            if reserve.contains(i+1) { // 자신보다 번호가 큰 사람 중 reseve에 남아 있는 경우
                students[i] = true
                reserve.remove(at: reserve.firstIndex(of: i+1)!) // 헤딩 reserve 제거
                continue
            }
        }
    }

    students.removeFirst() // 무의미한 index 0의 값 제거
    
    return students.filter( {$0 == true }).count
}
