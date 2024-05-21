//
//  LongestSubstringWithoutRepeatingCharactersTests.swift
//  LeetCodeSolutionsTests
//
//  Created by Augusto Avelino on 21/05/24.
//

import XCTest
@testable import LeetCodeSolutions

final class LongestSubstringWithoutRepeatingCharactersTests: XCTestCase {
    typealias Solution = LongestSubstringWithoutRepeatingCharacters.Solution
    
    // MARK: System under test
    
    var sut: Solution!
    
    // MARK: - Setup

    override func setUpWithError() throws {
        sut = Solution()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - Tests
    
    /*
     Example 1:

     Input: s = "abcabcbb"
     Output: 3
     Explanation: The answer is "abc", with the length of 3.
     */
    func test_lengthOfLongestSubstring_returns3_whenUsingExample1() {
        let result = sut.lengthOfLongestSubstring("abcabcbb")
        XCTAssertEqual(3, result)
    }
    
    /*
     Example 2:

     Input: s = "bbbbb"
     Output: 1
     Explanation: The answer is "b", with the length of 1.
     */
    func test_lengthOfLongestSubstring_returns1_whenUsingExample2() {
        let result = sut.lengthOfLongestSubstring("bbbbb")
        XCTAssertEqual(1, result)
    }
    
    /*
     Example 3:

     Input: s = "pwwkew"
     Output: 3
     Explanation: The answer is "wke", with the length of 3.
     Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
     */
    func test_lengthOfLongestSubstring_returns3_whenUsingExample3() {
        let result = sut.lengthOfLongestSubstring("pwwkew")
        XCTAssertEqual(3, result)
    }
    
    func test_lengthOfLongestSubstring_returns3_whenUsingExample4() {
        let result = sut.lengthOfLongestSubstring("dvdf")
        XCTAssertEqual(3, result)
    }
    
    func test_lengthOfLongestSubstring_returns0_whenGivenAnEmptyString() {
        let result = sut.lengthOfLongestSubstring("")
        XCTAssertEqual(0, result)
    }
    
    func test_lengthOfLongestSubstring_returns1_whenGivenStringContainingOnlyASpace() {
        let result = sut.lengthOfLongestSubstring(" ")
        XCTAssertEqual(1, result)
    }
}
