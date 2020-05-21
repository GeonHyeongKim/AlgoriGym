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
//                        iii) 이진 탐색(Binary Search) : O(NlogN)
//                           증가 수열의 길이를 최대한 늘리는데 가장 유리한 증가 수열
//                           1) case1, array[i]가 dp(i-1)의 마지막 항 보다 큰 경우.
//                           2) case2, array[i]가 dp(i-1)의 마지막 항에 비해서만 작은 경우.
//                           3) case3, array[i]가 중간항에 비교해서 작을 경우. -> lower_bound(이분 탐색을 통해 해당하는 위치를 return) 이용
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

// MARK: - 이진 탐색(Binary Search) : O(N LogN)
// 1) case1, array[i]가 dp(i-1)의 마지막 항 보다 큰 경우.
// 2) case2, array[i]가 dp(i-1)의 마지막 항에 비해서만 작은 경우.
// 3) case3, array[i]가 중간항에 비교해서 작을 경우. -> lower_bound(이분 탐색을 통해 해당하는 위치를 return) 이용

func lisWithBinarySearch(_ array: inout [Int]) -> Int {
    
}

// Binary search
func lowerBound(arr: inout [Int], start: Int, end: Int, target: Int) -> Int{
    var mid: Int
    var start = start
    var end = end
    
    while (end - start > 0) {  // 주어진 범위[start,end]에서 탐색하도록 한다. start == end이면 반복 종료
        mid = (start + end) / 2  // 주어진 범위의 중간 위치를 계산한다
        
        if (arr[mid] < target){ // 찾고자 하는 값보다 작으면 오른쪽으로 한 칸만 더 시작 구간 갱신
            start = mid + 1
        } else {// 찾고자 하는 값보다 크면 거기까지 끝 구간 갱신
            end = mid;
        }
    }
    return end + 1; // 찾는 구간에 없는 경우 가장 마지막 +1 위치 전달
}
