//
//  Heap Sort.swift
//  Primary idea:   <Data Structure>
//                  정렬 방식 : 힙 정렬은 완전 이진 트리를 기본으로 하는 힙(Heap) 자료구조를 기반으로한 정렬 방
//                  주의할 점 : 은 부모-자식 관계간의 이야기이고, 형제간은 고려하지 않는다.
//                  사용하는 곳 : 1. 가장 크거나 작은 값을 구할 때
//                             2. 최대 k 만큼 떨어진 요소들을 정렬할 때
//                  heapify()(=siftDown)은 node(element)를 아래로 내리는 역할
//
//  Created by gunhyeong on 2020/05/12.
//

import Foundation

func heapSort(array arr: inout [Int]) {
    
    let len = arr.count

    // init, max heap
    for i in stride(from: len/2-1 , through: 0, by: -1) { // len ~ 0 (0 포함 o)
    }
    
    // for extract max element from heap
    for i in stride(from: len-1, to: 0, by: -1) { // len ~ <0 (0 포함 x)
        arr.swapAt(0, i) // 배열의 마지막 element가 계산된 max 값
    }
}
