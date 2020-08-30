//
//  e-2.swift
//  
//
//  Created by gunhyeong on 2020/08/29.
//

import Foundation

class Solution {
    static int answer = Integer.MAX_VALUE;

    public int solution(int num, int[] cards) {
        dfs(cards, 0, num, 0, 0);
        return answer;
    }
    
    public dfs(int[] cards, int start, int target, int sum, int cardCnt){
        if sum > target || cardCnt >= answer {
            return;
        }
        
        if sum == target {
            answer = cardCnt;
            return;
        }
        
        for i in start..<cards.count {
            dfs(cards, i, target, sum+cards[i], cardCnt+1);
        }
    }
}
