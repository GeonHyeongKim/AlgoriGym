//
//  근우의 다이어리 꾸미기.swift
//  Question Link: https://www.acmicpc.net/problem/16676
//  Primary idea:       (Greedy)
//                      1. 문자열을 입력 받는다.
//                      2. 문자열의 길이를 계산한다.
//                      3. 문자열의 길이만큼 1이 포함되는 경우가 존재하는지 판단한다.
//                      4. 3의 조건을 만족하면 문자열의 길이를, 만족하지 않으면 문자열 길이 -1을 출력한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/10/02.
//

import Foundation

int n,chk_n;
string s_chk_n;

cin >> n;

string s = to_string(n);


int size = s.size();
for(int i = 0; i < size; i++)
   s_chk_n+='1';
chk_n = atoi(s_chk_n.c_str());

if(n>=chk_n) cout << size;
else if(n == 0) cout << 1;
else         cout << size-1;
