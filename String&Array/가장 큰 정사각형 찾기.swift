//
//  가장 큰 정사각형 찾기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12905
//  Primary idea:       <Dynamic Programming>
//                      1. DP(Dynamic Programming)를 이용
//                      2. 배열의 [1][1]부터 반복문을 돌린다. (첫 번째 행, 첫 번째 열 무시, 이유는 2번 참고)
//                      3. 현재 값이 1일 경우, 좌측값, 상단값, 좌측상단값 중 가장 작은 값의 +1 한 값을 현재 값으로 할당.
//                      4. 배열이 끝날 때 까지 반복.
//                      5. 배열의 가장 큰 값이 현재 배열의 가장 큰 정사각형의 값이 된다.
//
//  Time Complexity : O(n^2)
//  Space Complexity : O(1)
//  Runtime: 0.13 ~ 1.61 ms
//  Memory Usage: 23.8 ~ 24.3 MB
//
//  Created by gunhyeong on 2020/07/03.
//

import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var answer = 0;
    
    var lengthY = board.length;
    var lengthX = board[0].length;
    var max = 0;
    
    // 행이나 열의 길이가 2 미만이라면 직접 돌리면서 1이 하나라도 있는지 체크 합니다.
    // 하나라도 있으면 통과.
    if (lengthY < 2 || lengthY < 2) {
        for(var i = 0 ; i < lengthY ; i++){
            for(var j = 0;  j < lengthX ; j++) {
                if (board[i][j] === 1) {
                    max = 1;
                }
            }
        }
    } else {
        // 첫 번째 행열을 제외시키기 위해서 i와 j에 1을 할당합니다.
        for(var i = 1 ; i < lengthY ; i++){
            for(var j = 1;  j < lengthX ; j++) {
                
                // 1이 아닐 경우 패스! 1인 값만 동적으로 변경해 줍니다.
                if(board[i][j] === 1 ){
                    // 현재 값의 좌측값, 상단값, 좌측상단값 중 최소값에 +1을 해줍니다.
                    board[i][j] = Math.min(board[i - 1][j], board[i][j - 1], board[i - 1][j - 1]) + 1;
                    
                    // 다시 배열을 돌리는 수고를 하지않기 위해서 max값을 찾아 저장해 줍니다.
                    if (board[i][j] > max) {
                        max = board[i][j];
                    }
                }
            }
        }
    }
    
    return Math.pow(max, 2);
}
