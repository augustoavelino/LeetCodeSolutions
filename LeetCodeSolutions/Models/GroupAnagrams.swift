//
//  GroupAnagrams.swift
//  LeetCodeSolutions
//
//  Created by Augusto Avelino on 16/05/24.
//

import Foundation

extension String {
    func isAnagram(of string: String) -> Bool {
        var mutable = string
        for char in self {
            if let index = mutable.firstIndex(of: char) {
                mutable.remove(at: index)
            } else {
                return false
            }
        }
        return mutable.isEmpty
    }
}

enum GroupAnagrams {
    class Solution {
        func groupAnagrams(_ strs: [String]) -> [[String]] {
            var strings = strs
            var anagramList: [[String]] = []
            while let string = strings.popLast() {
                var anagrams = [string]
                while let index = strings.lastIndex(where: { $0.isAnagram(of: string) }) {
                    anagrams.append(strings.remove(at: index))
                }
                anagramList.append(anagrams)
            }
            return anagramList
        }
    }
}
