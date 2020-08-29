//
//  내려가기.swift
//  Question Link: https://www.acmicpc.net/problem/2096
//  Primary idea:       <Dynamic programming>
//                      1. RGB 거리와 같이 각 위치의 최대값과 최소값을 저장하면서 최종 위치의 최대와 최소를 출력하면 되는 문제이다.
//                      2. 단 하나의 최대 최소 값이 아닌 3개의 길 모두의 해당하는 최대값과 최소값을 저장해야 한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/29.
//

import Foundation

var n, m[100001][3], M[100001][3];
var main(){
    scanf("%d", &n);
    for(int i = 0; i < 3; i++){
        var input = Int(readLine())!
        M[0][i] = m[0][i];
    }
    for(int i = 1; i < n; i++){
        for(int j = 0; j < 3; j++){
            scanf("%d", &m[i][j]);
            M[i][j] = m[i][j];
            if(j == 0) M[i][j] += max(M[i-1][0], M[i-1][1]), m[i][j] += min(m[i-1][0], m[i-1][1]);
            else if(j == 1) M[i][j] += max(max(M[i-1][0], M[i-1][1]), M[i-1][2]), m[i][j] += min(min(m[i-1][0], m[i-1][1]), m[i-1][2]);
            else M[i][j] += max(M[i-1][1], M[i-1][2]), m[i][j] += min(m[i-1][1], m[i-1][2]);
        }
    }
    print("%d %d", max(max(M[n - 1][0], M[n - 1][1]), M[n - 1][2]), min(min(m[n - 1][0], m[n - 1][1]), m[n - 1][2]));
}
