//
//  오픈채팅방.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42888
//  Primary idea:       <String & Array>
//                      1. 배열([String:String])을 이용
//                      2. record를 순회한다.
//                      3. Enter, Leave 인 경우 유저 아이디와 함께 정답에 출력될 메시지의 종류를 기록, chatMsg
//                      4. Enter, Change 인 경우 연관 배열을 이용하여 각 유저 아이디를 키로, 닉네임을 값으로 저장해 둡니다. 이렇게 해서 최종 닉네임을 유저 아이디별로 유지합니다.
//                      5. chatMsg 를 순회하면서 채팅방에 출력할 메시지를 생성할 때, 연관 배열에 저장된 아이디별 최종 닉네임을 이용하면 됩니다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/10.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    var userList = [String:String]() // id:name
    var chatMsg = [[String]]()
    var answer = [String]()
    
    for message in record {
        let separateMsg = message.components(separatedBy: " ")
        let action = separateMsg[0]
        let id = separateMsg[1]
        
        if action == "Enter" {
            userList[id] = separateMsg[2]
            chatMsg.append([id, "님이 들어왔습니다."])
        } else if action == "Leave" {
            chatMsg.append([id, "님이 나갔습니다."])
        } else if action == "Change" {
            userList[id] = separateMsg[2]
        }
    }
    
    for msg in chatMsg {
        let name = userList[msg[0]]!
        let action = msg[1]
        answer.append("\(name)\(action)")
    }
    
    return answer
}
