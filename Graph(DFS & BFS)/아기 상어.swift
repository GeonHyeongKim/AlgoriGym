//
//  아기 상어.swift
//  Question Link: https://www.acmicpc.net/problem/16236
//  Primary idea:       (DFS & BFS)
//                      1.
//
//  Time Complexity : O(n^4)
//  Space Complexity : O(n^2)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/12/08.
//

import Foundation

let size = Int(readLine()!)!
var map = [[Int]]()

for _ in 0..<size {
    let row = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(row)
}


import java.io.*;
import java.util.*;

/*
시간 복잡도: O(n^4)
공간 복잡도: O(n^2)
사용한 알고리즘: BFS(완전 탐색)
사용한 자료구조: 2차원 배열, 큐
 */

public class Main{

    public static final int max_val = 401, max_int = 21;
    public static int n, shark_x, shark_y, min_dist, min_x, min_y, result, eat_cnt = 0, shark_size = 2;
    public static int [][] a, check;
    public static int [] dx = {0, 0, 1, -1}, dy = {-1, 1, 0, 0};
    public static void main(String args[]) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        n = Integer.parseInt(br.readLine());
        a = new int[n + 1][n + 1];
        check = new int[n+1][n+1];

        for(int i=1; i<=n; i++){
            StringTokenizer st = new StringTokenizer(br.readLine());
            for(int j=1; j<=n; j++){
                a[i][j] = Integer.parseInt(st.nextToken());

                if(a[i][j] == 9){
                    shark_x = i;
                    shark_y = j;
                    a[i][j] = 0;
                }
            }
        }

        while(true){
            init_check();

            bfs(shark_x, shark_y);

            if(min_x != max_int && min_y != max_int){
                result += check[min_x][min_y];

                eat_cnt++;

                if(eat_cnt == shark_size){
                    shark_size++;
                    eat_cnt = 0;
                }

                a[min_x][min_y] = 0;

                shark_x = min_x;
                shark_y = min_y;
            }

            else{
                break;
            }
        }

        System.out.println(result);
    }

    public static void init_check(){
        min_dist = max_val;
        min_x = max_int;
        min_y = max_int;

        for(int i=1; i<=n; i++){
            for(int j=1; j<=n; j++){
                check[i][j] = -1;
            }
        }
    }

    public static void bfs(int x, int y){
        Queue<info> q = new LinkedList<info>();
        check[x][y] = 0;
        q.add(new info(x, y));

        while(!q.isEmpty()){
            info cur = q.poll();
            x = cur.x;
            y = cur.y;

            for(int i=0; i<4; i++){
                int nx = x + dx[i];
                int ny = y + dy[i];

                if(nx < 1 || nx > n || ny < 1 || ny > n) continue;
                if(check[nx][ny] != -1 || a[nx][ny] > shark_size) continue;

                check[nx][ny] = check[x][y] + 1;

                if(a[nx][ny] != 0 && a[nx][ny] < shark_size){

                    if(min_dist > check[nx][ny]){
                        min_x = nx;
                        min_y = ny;
                        min_dist = check[nx][ny];
                    }
                    else if(min_dist == check[nx][ny]){
                        if(min_x == nx){
                            if(min_y > ny){
                                min_x = nx;
                                min_y = ny;
                            }
                        }else if(min_x > nx){
                            min_x = nx;
                            min_y = ny;
                        }
                    }
                }

                q.add(new info(nx, ny));
            }
        }

    }
}

class info{
    int x, y;

    info(int x, int y){
        this.x = x;
        this.y = y;
    }
};
