/*
*  k-i.swift
*  Primary idea:      <String&Array>
*
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/05/09.
*/

import Foundation

var keypad = [2, 5, 8, 0]

func solution(_ numbers:[Int], _ hand:String) -> String {
    var left = -1 // *
    var right = -2 // #
    var result = ""

    for n in numbers {
        switch n {
        case 1, 4, 7:
            left = n
            result += "L"
        case 3, 6, 9:
            right = n
            result += "R"
        case 2, 5, 8, 0:
            let distanceLeft = calLen(n, left)
            let distanceRight = calLen(n, right)

            if distanceLeft > distanceRight {
                right = n
                result += "R"
            } else if distanceLeft < distanceRight{
                left = n
                result += "L"
            } else {
                if hand == "right" {
                    right = n
                    result += "R"
                } else {
                    left = n
                    result += "L"
                }
            }
        default:
            print("error")
        }
    }
    return result
}

func calLen(_ target: Int, _ hand: Int) -> Int {
    var hand = hand
    var carry = 0
    
    switch hand {
    case 1, 4, 7:
        hand += 1
        carry = 1
    case 3, 6, 9:
        hand -= 1
        carry = 1
    default: break
    }
    
    return abs(keypad.distance(from: keypad.firstIndex(of: target)!, to: keypad.firstIndex(of: hand)!)) + carry
}

print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
