//
//  LIS(Longest Increasing Sequence).swift
//  Primary idea:   <Data Structure>
//                  1. 최장 증가 수열 : 가장 긴 증가하는 부분 수열
//                        어떤 임의의 수열이 주어질 때, 이 수열에서 몇 개의 수들을 제거해서 부분수열을 만들 수 있다.
//                        이때 만들어진 부분수열 중 오름차순으로 정렬된 가장 긴 수열을 최장 증가 부분 수열이라 한다.
//                  2. 구현 방법 (시간복잡도)
//                        i) 완전탐색 : O(N^2)
//                        ii) DP : O(N^2)
//                        iii) 이진 탐색 : O(NlogN)
//
//  Created by gunhyeong on 2020/05/20.
//

import Foundation
