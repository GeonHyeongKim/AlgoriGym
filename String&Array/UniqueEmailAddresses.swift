//
//  UniqueEmailAddresses.swift
//  Question Link: https://leetcode.com/problems/unique-email-addresses/
//  Primary idea:   1. Set을 통해 email 분리
//                  2. filter 함수 이용
//
//  Created by gunhyeong on 2020/02/05.
//

import Foundation

class NumUniqueEmails {
    func numUniqueEmails(_ emails: [String]) -> Int {
        var emailSet:Set<String> = []
        for s in emails {
            let address = s.components(separatedBy: "@")
            let name = address[0].components(separatedBy: "+").first?.filter({$0 != "."})
            
            emailSet.insert(name!+address.last!)
        }
        
        return emailSet.count
    }
}