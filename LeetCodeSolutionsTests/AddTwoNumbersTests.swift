//
//  AddTwoNumbersTests.swift
//  LeetCodeSolutionsTests
//
//  Created by Augusto Avelino on 16/05/24.
//

import XCTest
@testable import LeetCodeSolutions


final class AddTwoNumbersTests: XCTestCase {
    
    // MARK: System under test
    
    var sut: AddTwoNumbers.Solution!
    
    // MARK: - Setup

    override func setUpWithError() throws {
        sut = AddTwoNumbers.Solution()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - Tests
    
    func test_addTwoNumbers_shouldReturnTheSumOfTwoLinkedLists() {
        for testCase in TestCases.allCases {
            let sum = sut.addTwoNumbers(testCase.input.l1, testCase.input.l2)
            XCTAssertEqual(sum, testCase.output)            
        }
    }
}

typealias ListNode = AddTwoNumbers.ListNode
typealias TestInput = (l1: AddTwoNumbers.ListNode?, l2: AddTwoNumbers.ListNode?)

struct TestCase {
    let input: TestInput
    let output: ListNode
}

enum TestCases {
    static var allCases: [TestCase] {
        [example1, example2, example3]
    }
    
    static let example1 = TestCase(
        input: (
            ListNode(2, ListNode(4, ListNode(3))),
            ListNode(5, ListNode(6, ListNode(4)))
        ),
        output: ListNode(7, ListNode(0, ListNode(8)))
    )
    
    static let example2 = TestCase(
        input: (
            ListNode(0),
            ListNode(0)
        ),
        output: ListNode(0)
    )
    
    static let example3 = TestCase(
        input: (
            ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9))))))),
            ListNode(9, ListNode(9, ListNode(9, ListNode(9))))
        ),
        output: ListNode(8, ListNode(9, ListNode(9, ListNode(9, ListNode(0, ListNode(0, ListNode(0, ListNode(1))))))))
    )
}
