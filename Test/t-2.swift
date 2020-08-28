//
//  t-2.swift
//  
//
//  Created by gunhyeong on 2020/08/28.
//

import Foundation


func solve(_ input: (userInfo: UserInfo, passwords: [String])) -> [Bool] {
    var answer = [Bool]()

    for password in input.passwords {
        let result = checkCondition(input.userInfo, password)
        answer.append(result)
    }

    return answer
}

func checkCondition(_ userInfo: UserInfo, _ password: String) -> Bool {
    let phoneNumber = userInfo.phoneNumber
    let sixDigitBirthday = userInfo.sixDigitBirthday
    let removeHyphenFromPhone = phoneNumber.split(separator: "-")

    // 4자리가 아닌 비밀번호
    if password.count != 4 { return false }

    if password.contains(where: {!$0.isNumber}) { return false }

    // 휴대전화번호 중간 4자리 or 휴대전화번호 마지막 4자리
    if password == removeHyphenFromPhone[1] || password == removeHyphenFromPhone[2] { return false }

    // 주민등록번호 앞 6자리 중 연속된 숫자 4개
    if sixDigitBirthday.range(of: password) != nil { return false }

    // 동일 숫자 연속 3회 이상 포함
    for num in password {
        let str = "\(num)\(num)\(num)"
        if password.range(of: str) != nil {
            return false
        }
    }

    let number = "123456789"
    // 연속되는 숫자 3개 포함
    var temp = password
    temp.removeFirst()
    let first = temp
    temp = password
    temp.removeLast()
    let second = temp

    if number.range(of: first) != nil || number.range(of: second) != nil { return false }

    return true
}
