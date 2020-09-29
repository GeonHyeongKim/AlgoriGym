//
//  트리.swift
//  Question Link: https://www.acmicpc.net/problem/1068
//  Primary idea:       (tree)
//                      1. 이 문제는 우선적으로 트리를 만들어주고 삭제할 노드를 받은 후에 루트에서부터 DFS로 뻗어가면서 삭제된 노드를 제외한 자식노드가 0개인 노드의 개수를 세주면 된다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime: ms
//  Memory Usage: MB
//
//  Created by gunhyeong on 2020/09/29.
//

import Foundation

let cntTree = Int(readLine()!)!
let parentNode = readLIne()!.split(separator: " ").map{Int($0)!}
let removeNode = Int(readLine()!)!

void find(int node){
    int child = 0;
    int cn = tree[node].size();
    for(int i = 0; i < cn; i++){
        int x = tree[node][i];
        if(x == del)continue;
        find(x); child++;
    }
    if(!child)ans++;
}

int main(){
    scanf("%d", &n);
    tree = vector<vector<int> >(n);
    for(int i = 0; i < n; i++){
        scanf("%d", &par);
        if(par == -1){
            root = i;
            continue;
        }
        tree[par].push_back(i);
    }
    scanf("%d", &del);
    if(root == del)printf("0");
    else{
        find(root);
        printf("%d", ans);
    }
}
