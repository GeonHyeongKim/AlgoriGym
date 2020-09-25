//
//  Z.swift
//  Question Link: https://www.acmicpc.net/problem/1074
//  Primary idea:       (분할 정복 && 재귀)
//                      1. n을 통해 pow를 쓰지 않고 2의 제곱을 구한다. (1>>n)
//                      2. z()함수 : 사각형의 왼쪽 상단의 꼭지점의 좌표와 한변의 길이를 밴개변수로 받는다.
//                         i) 온쪽 상단의 꼭지점 : x, y
//                         ii) 한변의 길이, 즉 size
//                      3. 종료 조건은 한 변의 길이가 1이 됐을 경우, cnt를 증가시키고 false를 반환
//                      4. x, y가 r, c가 되었을 경우 true
//                      5. 2중 포문으로 4번 호출해주는 것과 동일하게 계산한다. ( r+i*m, c+j*m )
//                         i) getAnswer(r, c, m);
//                         ii) getAnswer(r, c+m, m);
//                         iii) getAnswer(r+m, c, m);
//                         iv) getAnswer(r+m, c+m, m);
//
//  Time Complexity :
//  Space Complexity :
//  Runtime: 16 ms
//  Memory Usage: 81.332 MB
//
//  Created by gunhyeong on 2020/09/24.
//

import Foundation

