//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  LeetCodeSolutions
//
//  Created by Augusto Avelino on 21/05/24.
//

import Foundation

enum LongestSubstringWithoutRepeatingCharacters {
    class Solution {
        func lengthOfLongestSubstring(_ s: String) -> Int {
            guard s.count > 0 else { return 0 }
            var length = 0
            var i = 0
            repeat {
                if length >= s.count - i { break }
                let startIndex = String.Index(utf16Offset: i, in: s)
                let startChar = s[startIndex]
                var currentSubstring = "\(startChar)"
                for j in i + 1..<s.count {
                    let currentIndex = String.Index(utf16Offset: j, in: s)
                    let currentChar = s[currentIndex]
                    if !currentSubstring.contains(currentChar) { currentSubstring.append(currentChar) }
                    else { break }
                }
                length = max(length, currentSubstring.count)
                i += 1
            } while i < s.count - 1
            return length
        }
    }
    
    enum RegexError: Error {
        case unexpected
    }
}
