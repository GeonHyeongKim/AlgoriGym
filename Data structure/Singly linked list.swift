/*
*  Singly linked list.swift
*  Primary idea:   <Data Structure>
*                  1. 정의 : 각 노드가 Data와 다음 노드의 주소를 가지고 한줄로 연결되어 있는 자료 구조
*                  2. 단일 연결 리스트의 특징
*                      1) 장점
*                           1} 동적 메모리 할당(연속하지 않은 데이터 구조) : 메모리에 커다란 가용 공간이 없음
*                              (* List의 삽입&삭제 : 원소의 개수가 많고, 삽입, 삭제 연산이 많이 발생하는 경우, 원소들의 이동 작업으로 인한 오버헤드가 증가 -> 메모리 사용의 비효율성 발생)
*                           2} 데이터의 재배열 : node의 link 필드에 저장되어 있는 주소만 바꾸어주면 되므로 데이터의 이동은 전혀 필요없음
*                      2) 단점
*                           1} 특정 node에 접근하는 방법 : 첫 node부터 시작하여 번째 특정 node까지 순차적으로 접근
*                           2} 연결 리스트를 운행할 때 링크의 반대쪽으로 운행할 필요가 있을 경우, 항상 연결 리스트의 첫 노드로 이동한 후 운행을 다시 시작해야하는 불편함
*                  3. 구성
*                      1) Node : 연결 리스트의 최소 단위
*                           1} Data : 원소의 값
*                           2} Link : 다음 node의 주소
*                      2) Head : 가장 처음 node
*                      3) Tail : 가장 마지막 node
*
*  Created by gunhyeong on 2020/04/21.
*/

import Foundation

public class Node {
    var data: Int
    var link: Node?
    
    init(_ data: Int, _ link: Node? = nil){
        self.data = data
    }
}

public class LinkedList {
    private var head: Node?
    private var tail: Node?
    
    // 비어 있는지 확인
    public var isEmpty: Bool {
        return head == nil
    }
    
    // 첫번째 Node
    public var fisrt: Node? {
        return head
    }
    
    // 마지막 Node
    public var last: Node? {
        return tail
    }
}

extension LinkedList: CustomStringConvertible { // 출력할 때 description 지정
    public var description: String {
        var str = ""
        var node = head
        
        while node != nil {
            str += "\(node!.data)"
            node = node!.link
            if node != nil { str += " -> " }
        }
        
        return str
    }
}
