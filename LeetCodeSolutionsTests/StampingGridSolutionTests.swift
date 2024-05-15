//
//  StampingGridSolutionTests.swift
//  LeetCodeSolutionsTests
//
//  Created by Augusto Avelino on 15/05/24.
//

import XCTest
@testable import LeetCodeSolutions

final class StampingGridSolutionTests: XCTestCase {
    
    // MARK: System under test
    
    var sut: StampingGrid.Solution!
    
    // MARK: - Setup

    override func setUpWithError() throws {
        sut = StampingGrid.Solution()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - Tests
    
    func test_possibleToStamp_shouldReturnFalse_whenStampSizeDoesNotFitTheGrid() {
        let grid = [[1,1,1,0],[0,0,0,1],[1,1,1,0],[1,1,0,0],[0,0,0,0],[0,1,0,1],[0,1,0,1],[1,1,1,0],[1,0,1,1],[0,0,0,1]]
        let stampHeight = 13, stampWidth = 6
        let result = sut.possibleToStamp(grid, stampHeight, stampWidth)
        XCTAssertFalse(result)
    }
    
    func test_possibleToStamp_shouldReturnTrue_whenPossibleToFitStamps() {
        let grid = [[1, 0, 0, 0], [1, 0, 0, 0], [1, 0, 0, 0], [1, 0, 0, 0], [1, 0, 0, 0]]
        let stampHeight = 4, stampWidth = 3
        let result = sut.possibleToStamp(grid, stampHeight, stampWidth)
        XCTAssertTrue(result)
    }
    
    func test_possibleToStamp_shouldReturnFalse_whenNotPossibleToFitStamps() {
        let grid = [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]]
        let stampHeight = 2, stampWidth = 2
        let result = sut.possibleToStamp(grid, stampHeight, stampWidth)
        XCTAssertFalse(result)
    }
}
