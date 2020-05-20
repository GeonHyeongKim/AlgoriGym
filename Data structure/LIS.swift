//
//  LIS(Longest Increasing Sequence).swift
//  Primary idea:   <Data Structure>
//                  1. 최장 증가 수열 : 가장 긴 증가하는 부분 수열
//                        어떤 임의의 수열이 주어질 때, 이 수열에서 몇 개의 수들을 제거해서 부분수열을 만들 수 있다.
//                        이때 만들어진 부분수열 중 오름차순으로 정렬된 가장 긴 수열을 최장 증가 부분 수열이라 한다.
//                  2. 구현 방법 (시간복잡도)
//                        i) 완전탐색 : O(N^2)
//                           1차원적으로는 증가 부분수열을 모두 만들어보면서 그중 가장 긴 증가 부분수열의 길이를 구하기
//                        ii) DP : O(N^2)
//                           BOTTOM-UP : array[i]의 값보다 작은 이전 dp의 최댓값 + 1
//                        iii) 이진 탐색 : O(NlogN)
//
//  Created by gunhyeong on 2020/05/20.
//

import Foundation

// MARK: - 완전탐색 : O(2^N)
// 1) 배열에서 증가 부분수열의 첫 수를 선택
// 2) 첫 수보다 배열에서 뒤에 있고 큰 후보값들의 배열을 추려 재귀
// 3) 증가 수열이 되는 수열 중 가장 길이가 긴 수열을 찾음
//
// 길이가
// 0일 때,  {}
// 1일 때, {3}, {2}, {6}, {4}, {5}, {1}
// 2일 때, {3,2}, {3,6}, {3,4}, {3,5}, ...
// 부분 수열의 길이가 긴 것부터 조사하는 것이 유리
func lisWithBruteForce(_ array: inout [Int]) -> Int{
    guard !array.isEmpty else {
        return 0
    }
    
    var result = 1
    
    for i in 0..<array.count {
        var temp = [Int]()
        for j in i+1..<array.count {
            if array[i] < array[j] {
                temp.append(array[j])
            }
        }
        
        result = max(result, lisWithBruteForce(&temp)+1 )
        print("\(result) \(temp.count) \(temp)")
    }
    
    return result
}

var arr = [1,4,6,8,3,5,6,7]
print(lisWithBruteForce(&arr)) //5
// MARK: - DP : O(N^2)
// array[i]의 값보다 작은 이전 dp의 최댓값 + 1

func lisWithDp(_ array: inout [Int]) -> Int {
    guard !array.isEmpty else {
        return 0
    }
    
    var dp = [Int](repeating: 1, count: array.count)
    
    for i in 1..<array.count {
        // 0 ~ i - 1 위치까지 반복
        for j in 0..<i {
            // 현재 위치의 값보다 작을때
            if array[i] > array[j] {
                dp[i] = max(dp[i], dp[j]+1)
            }
        }
    }
    
    return dp.max()!
}
