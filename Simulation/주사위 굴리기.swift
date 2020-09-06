//
//  주사위 굴리기.swift
//  Question Link: https://www.acmicpc.net/problem/14499
//  Primary idea:       <Simulation>
//                      1. 먼저 구를수 있는지 판단(다음 좌표가 지도 내부인지)
//                      2. 다음 주사위 상태에서 2번과 5번 면은 변하지 않는다. 오른쪽이므로, 현재 1번 면이 다음 3번 면으로, 현재 4번 면이 다음 1번 면으로, 현재 6번 면이 다음 4번 면으로, 현재 3번 면이 다음 6번 면으로 바뀌게 된다.
//                      3. 다음 상태공간을 만들었다면 6번 면과 지도 값을 비교하여 문제에 주어진 조건에 맞게 구현한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/06.
//

import Foundation

func Solution()
{
    int x = Sx;
    int y = Sy;
 
    for (int i = 0; i < Cmd.size(); i++)
    {
        int nx = x + dx[Cmd.at(i)];
        int ny = y + dy[Cmd.at(i)];
        int d = Cmd.at(i);
 
        if (nx < 0 || ny < 0 || nx >= N || ny >= M) continue;
        
        RollTheDice(d);
        if (MAP[nx][ny] == 0) MAP[nx][ny] = Dice[6];
        else
        {
            Dice[6] = MAP[nx][ny];
            MAP[nx][ny] = 0;
        }
 
        cout << Dice[1] << endl;
 
        x = nx;
        y = ny;
    }
}
