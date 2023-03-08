//
//  pivotIndexTests.swift
//  pivotIndexTests
//
//  Created by arifinfrds.engineer on 08/03/23.
//

import XCTest
@testable import pivotIndex

class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        
        if nums.isEmpty {
            return -1
        }
        
        for (index, number) in nums.enumerated() {
            
            let leftSum = calculateLeftSum(beforeIndex: index, source: nums)
            let rightSum = calculateRightSum(afterIndex: index, source: nums)
            
            if leftSum == rightSum {
                return index
            }
        }
        return -1
    }
    
    // MARK: - Helpers
    
    private func calculateLeftSum(beforeIndex index: Int, source nums: [Int]) -> Int {
        var sum = 0
        
        for i in 0..<index {
            sum += nums[i]
        }
        
        return sum
    }
    
    private func calculateRightSum(afterIndex index: Int, source nums: [Int]) -> Int {
        
        guard (index + 1) < nums.count else {
            return 0
        }
        
        var sum = 0
        
        for i in (index + 1)...nums.count - 1 {
            sum += nums[i]
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

}
