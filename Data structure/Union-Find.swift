//
//  Union-Find.swift
//  Primary idea:   <Data Structure>
//                  1. Tree로 구현
//                      i) 두 집합의 동일성을 루트 노드를 비교함으로써 수행가능
//                      ii) Union 연산으로 한 집합을 다른 집합의 서브트리로 넣는 것으로 구현가능
//                  2. init() : 모든 원소들이 모두 별도 집합에 속하도록 초기화합니다.
//                  3. find() : O(logN) : 어떤 원소가 주어졌을 때, 해당 원소가 속한 집합을 반환한다.
//                  4. union() : O(logN), O(1)이지만 find()를 사용 : 두 원소 a,b가 주어질 때, 각각이 속한 집합을 하나로 합칩니다.
//                  4. 최적화 - 높이가 심각하게 증가하는 것을 방지
//                      i) 랭크에 의한 합치기(union-by-rank)
//                          * 높이가 낮은 트리를 항상 높이가 높은 트리의 서브트리로 넣을 수 있도록 하는 것입니다.
//                          * 이렇게 되면 트리의 높이가 증가하는 경우는 두 트리의 높이가 같은 경우 뿐입니다.
//                      ii) 경로 압축 최적화(path compression)
//                          * 매번 루트를 찾을 필요 없이 아예 해당 노드를 루트의 직계 자손 노드로 바꿔버리는 것입니다.
//                          * 이렇게 되면 트리의 높이가 낮아져서 이후 find를 호출했을 때의 연산이 확연이 줄어들게 됩니다.
//                          * 1번에서 높이를 기준으로 합치는 최적화와 함께 적용하면, find를 호출할 때마다 높이가 변화하므로 1번의 기준을 높이 대신 다른 기준을 잡을 필요가 있습니다.
//                            (그래서 높이가 아닌 랭크라는 용어를 사용합니다)
//
//  Created by gunhyeong on 2020/07/18.
//

import Foundation

class UnionFindSet {
    var root: [Int]
    
    init(_ n: Int) {
        self.root = Array(0..<n)
    }
    
    func find(_ num: Int) -> Int {
        if root[num] < 0 {
            return num
        }
        root[num] = find(root[num]) // 현재 노드의 루트 노드를 바꿔준다.
        return root[num]
    }
    
    func union(_ base: Int, _ other: Int) {
        let baseRoot = find(base)
        let otherRoot = find(other)
        
        
        if baseRoot == otherRoot {
            return
        } else if root[baseRoot] < root[otherRoot] {
            root[baseRoot] = otherRoot
        } else { // root[baseRoot] > root[otherRoot]
            root[otherRoot] = baseRoot
        }
    }
}
