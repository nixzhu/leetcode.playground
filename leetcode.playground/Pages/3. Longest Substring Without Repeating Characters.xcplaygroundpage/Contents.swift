//: [Previous](@previous)

/*
 3. Longest Substring Without Repeating Characters

 https://leetcode.com/problems/longest-substring-without-repeating-characters/

 Given a string, find the length of the longest substring without repeating characters.

 Example 1:

 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

func test(_ f: (String) -> Int) {
    assert(f("abcabcbb") == 3)
    assert(f("bbbbb") == 1)
    assert(f("pwwkew") == 3)
}

do {
    class Solution {
        func lengthOfLongestSubstring(_ s: String) -> Int {
            let characters = s.map { $0 }
            let n = characters.count
            var result = 0
            for i in 0..<n {
                for j in i...n {
                    if allUnique(characters, i, j) {
                        result = max(result, j - i)
                    }
                }
            }
            return result
        }

        private func allUnique(_ characters: [Character], _ i: Int, _ j: Int) -> Bool {
            let x = characters[i..<j]
            return Set(x).count == (j - i)
        }
    }

    test(Solution().lengthOfLongestSubstring)
}

do {
    class Solution {
        func lengthOfLongestSubstring(_ s: String) -> Int {
            let n = s.count
            var result = 0
            for i in 0..<n {
                for j in i...n {
                    if allUnique(s, i, j) {
                        result = max(result, j - i)
                    }
                }
            }
            return result
        }

        private func allUnique(_ s: String, _ i: Int, _ j: Int) -> Bool {
            let begin = s.index(s.startIndex, offsetBy: i)
            let end = s.index(s.startIndex, offsetBy: j)
            return Set(s[begin..<end].map { $0 }).count == (j - i)
        }
    }

    test(Solution().lengthOfLongestSubstring)
}

do {
    class Solution {
        func lengthOfLongestSubstring(_ s: String) -> Int {
            let characters = s.map { $0 }
            let n = characters.count
            var set: Set<Character> = []
            var result = 0
            var i = 0
            var j = 0
            while i < n && j < n {
                if set.contains(characters[j]) {
                    set.remove(characters[i])
                    i += 1
                } else {
                    set.insert(characters[j])
                    j += 1
                    result = max(result, j - i)
                }
            }
            return result
        }
    }

    test(Solution().lengthOfLongestSubstring)
}

do {
    class Solution {
        func lengthOfLongestSubstring(_ s: String) -> Int {
            let characters = s.map { $0 }
            let n = characters.count
            var cache: [Character: Int] = [:]
            var result = 0
            var i = 0
            for j in 0..<n {
                let key = characters[j]
                if let index = cache[key] {
                    i = max(index, i)
                }
                result = max(result, j - i + 1)
                cache[key] = j + 1
            }

            return result
        }
    }

    test(Solution().lengthOfLongestSubstring)
}

print("end")

//: [Next](@next)
