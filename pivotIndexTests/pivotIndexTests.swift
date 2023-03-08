//
//  pivotIndexTests.swift
//  pivotIndexTests
//
//  Created by arifinfrds.engineer on 08/03/23.
//

import XCTest
@testable import pivotIndex

// O(n^2) -> O(n)
class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        
        if nums.isEmpty {
            return -1
        }
        
        var leftSum = 0
        let total = nums.total
        
        for (index, number) in nums.enumerated() {
            
            let rightSum = total - (leftSum + number)
            
            if leftSum == rightSum {
                return index
            }
            leftSum += number
        }
        return -1
    }
}

private extension Array where Element == Int {
    var total: Int {
        var sum = 0
        for number in self {
            sum += number
        }
        return sum
    }
}

final class pivotIndexTests: XCTestCase {

    func test_pivotIndex_returnsMinusOneOnEmptyArray() {
        let sut = Solution()
        
        let result = sut.pivotIndex([])
        
        XCTAssertEqual(result, -1)
    }
    
    func test_pivotIndex_returnsMinusOneOnNotFoundIndex() {
        let sut = Solution()
        
        let result = sut.pivotIndex([1,2,3])
        
        XCTAssertEqual(result, -1)
    }
    
    func test_pivotIndex_returnsZeroOnEdgePivotIndex() {
        let sut = Solution()
        
        let result = sut.pivotIndex([2,1,-1])
        
        XCTAssertEqual(result, 0)
    }
    
    func test_pivotIndex_returnsCorrectPivotIndex() {
        let sut = Solution()
        
        let result = sut.pivotIndex([1,7,3,6,5,6])
        
        XCTAssertEqual(result, 3)
    }

}
