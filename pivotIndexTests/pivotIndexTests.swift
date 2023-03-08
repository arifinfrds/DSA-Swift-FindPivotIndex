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
        -1
    }
}

final class pivotIndexTests: XCTestCase {

    func test_pivotIndex_returnsMinusOneOnEmptyArray() {
        let sut = Solution()
        
        let result = sut.pivotIndex([])
        
        XCTAssertEqual(result, -1)
    }

}
