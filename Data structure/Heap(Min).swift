/*
 *  Heap.swift
 *  Primary idea:   <Data Structure>
 *                  1. 정의 : 완전 이진 트리를 기본으로 하는 힙(Heap) 자료구조를 기반으로한 정렬 방식
 *                           (* 완전 이진 트리는 삽입할 때 왼쪽부터 차례대로 추가하는 이진 트리)
 *                  2. Hea[의 특징
 *                      1) 장점
 *                           1} 힙 프로퍼티 : 부모 노드의 값이 자식 노드의 값보다 항상 큰 최대 힙과 그 반대인 최소 힙.
 *                                         (부모-자식 관계간의 이야기이고, 형제간은 고려하지 않음)
 *                           2) 시간 복접도 : 최악, 최선, 평균 모두 O(nlogn)
 *                           3) 불안정 정렬
 *                  3. Heap 을 활용한 것들
 *                      1) 최대 최소를 계산할 때!
 *                      2) Heap Sort ( 힙 정렬 )
 *                      3) Priority Queue 에 활용됨 - 또 이 Priority Queue 는 그래프 알고리즘인 prim 이나 Dijkstra 알고리즘에서 활용되므로 Heap 은 이 알고리즘 들의 기초개념이 되는 것.
 *                  4. 표현방법 : 배열
 *                     이유 : 힙의 값들이 메모리 안에서 모두 함께 저장되기 때문에 시간복잡도와 공간복잡도 측면에서 효율적이다. 메모리 안에 함께 저장된다는 것은 배열의 특징이야. 스위프트가 구현한 표준라이브러리의 Array 는 그러한 특징을 같는 효율적.
 *                     특징
 *                           1) 해당 노드의 왼쪽 자식 노드의 인덱스는 2i + 1
 *                           2) 해당 노드의 오른쪽 자식 노드의 인덱스는 2i + 2
 *                           3) 해당 노드의 부모 노드의 인덱스는 i -1 / 2
 *                  5. 참고
 *                      1) https://the-brain-of-sic2.tistory.com/55
 *
 *  Created by gunhyeong on 2020/05/10.
 */

import Foundation

struct Heap<Element: Comparable> { // Comparable을 채택하게한 건 sort에 <, >를 가능
    var elements: [Element] = [] // 배열로 구현! Tree : O(log n), 배열 : O(1)
    var sort: (Element, Element) -> Bool // 함수 타입의  상수가 있음
    
    // @escaping : 클로져가 함수의 매개변수로 쓰일 때 그 함수가 리턴한 후에도 클로져가 호출될때 escaping 이 필요
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
        
        if !elements.isEmpty {
            for i in stride(from: elements.count/2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    
    // 비어 있는가?
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    // 갯수
    var count: Int {
        return elements.count
    }
    
    // 가장 최대&최소 element 찾기
    func peek() -> Element? {
        return elements.first
    }
    
    // 왼쪽 자식의 index 찾기
    func leftChildIndex(ofParentAt index: Int) -> Int {
        return 2*index + 1
    }
    
    // 오른쪽 자식의 index 찾기
    func rightChileIndex(ofParentAt index: Int) -> Int {
        return 2*index + 2
    }
    
    // 부모의 index 찾기
    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }
    
    //MARK: - root node 제거
    // 시간 복잡도 : swap은 O(1), siftDown은 O(log n)이므로 O(log n)
    mutating func remove() -> Element? {
        guard !isEmpty else { // 비어 있으면 아무 동작 안함
            return nil
        }
        
        elements.swapAt(0, count - 1) // 처음과 마지막 element 위치 변경
        
        defer { // { } 실행구문 안의 로직을 가장 마지막에 실행하도록 순서를 보장해주는 역할
            siftDown(from: 0) // root node를 sift down
        }
        
        return elements.removeLast() // 삭제할 node 삭제 후 반환
    }
    
    //MARK: - node 아래로 내리기
    // 메소드가 실행될 시점에는, 배열의 최대&최소 값이 root noed가 되어있는 시점
    mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChileIndex(ofParentAt: parent)
            
            var candidate = parent // 탐색할 node
            if right < count, sort(elements[left], elements[candidate]) {
                // 왼쪽 child node가 존재할떄, child node 값이 parent node 값보다 클 경우
                candidate = left
            }
            
            if right < count, sort(elements[right], elements[candidate]) {
                // 오른쪽 child node가 존재할떄, child node 값이 parent node 값보다 클 경우
                candidate = right
            }
            
            if candidate == parent { // 반복문 종료
                return
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    //MARK: - new node 삽입
    // 시간 복잡도 : append는 O(1), siftUp은 O(log n) 이므로 전체 효율은 O(log n)
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1) // 배열의 마지막에 삽입된 element 위로 올리기
    }
    
    //MARK: - node 위로 내리기
    // 메소드가 실행될 시점에는, 배열의 최대&최소 값이 root noed가 되어있는 시점
    mutating func siftUp(from index: Int) {
        var child = index // 마지막 index
        
        while true {
            let parent = parentIndex(ofChildAt: child)
            
            if child > 0 && sort(elements[child], elements[parent]) { // >
                elements.swapAt(child, parent)
                child = parent
            } else { // 종료 조건
                return
            }
        }
    }
    
    //MARK: - 임의의 노드 제거하기
    mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else {  return nil }
        // 위에 정의한 count 를 쓰지않은 이유는 count 는 Heap 인스턴스에서 count를 알려고 하는 것
        // 인스턴스의 메소드가 실행될떄마다 값이 바뀔 가능성 존재
        
        if index == elements.count - 1 {
            return elements.removeLast()
        }else {
            elements.swapAt(index, elements.count-1) // 제거하려는 값을 맨뒤로 변경
            siftDown(from: index) // index 자리 기준으로 아랫쪽 재정렬
            siftUp(from: index) // index 자리 기준으로 위쪽 재정렬
        }
        return elements.removeLast()
    }
}

let array = [7,2,1,3,5,4,6,8]
// > max , < min 을 의미
var heap = Heap<Int>(sort: <, elements: array)

print(heap.elements) // [1, 2, 4, 3, 5, 7, 6, 8]

print(heap.remove()!) // 1
print(heap.elements) // [2, 3, 4, 8, 5, 7, 6]

heap.insert(3)
print(heap.elements) // [2, 3, 4, 3, 5, 7, 6, 8]

print(heap.remove(at: 2)!) // 4
print(heap.elements) // [2, 3, 6, 3, 5, 7, 8]


print(heap.remove(at: 3)!) // 3
print(heap.elements) // [2, 3, 6, 8, 5, 7]

