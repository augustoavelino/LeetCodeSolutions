//
//  GroupAnagramsTests.swift
//  LeetCodeSolutionsTests
//
//  Created by Augusto Avelino on 16/05/24.
//

import XCTest
@testable import LeetCodeSolutions

final class GroupAnagramsTests: XCTestCase {
    
    // MARK: System under test
    
    var sut: GroupAnagrams.Solution!

    // MARK: - Setup
    
    override func setUpWithError() throws {
        sut = GroupAnagrams.Solution()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - Tests
    
    func test_groupAnagrams_shouldGroupAnagramsIntoAnArrayOfArrays() {
        for testCase in TestCase.all {
            let result = sut.groupAnagrams(testCase.input)
            let sortedResult = result.map({ $0.sorted() }).sorted(by: { $0.count < $1.count && $0.first! < $1.first! })
            XCTAssertEqual(sortedResult, testCase.output)
        }
    }
    
    // MARK: - Helpers
    
    struct TestCase {
        let input: [String]
        let output: [[String]]
        
        // MARK: Test cases
        
        static let all = [example1, example2, example3]
        
        static let example1 = TestCase(
            input: ["eat","tea","tan","ate","nat","bat"],
            output: [["bat"],["nat","tan"],["ate","eat","tea"]]
        )
        static let example2 = TestCase(
            input: [""],
            output: [[""]]
        )
        static let example3 = TestCase(
            input: ["a"],
            output: [["a"]]
        )
    }
}
