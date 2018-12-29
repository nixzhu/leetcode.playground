/*
 1. Two Sum

 https://leetcode.com/problems/two-sum/

 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 Example:

 Given nums = [2, 7, 11, 15], target = 9,

 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

func test(_ f: ([Int], Int) -> [Int]) {
    do {
        let nums = [2, 7, 11, 15]
        let target = 9
        assert(f(nums, target) == [0, 1])
    }
    do {
        let nums = [2, 7, 11, 15]
        let target = 22
        assert(f(nums, target) == [1, 3])
    }
}

do {
    // Brute Force，不推荐
    // 利用两个循环，内层循环负责检查
    // 时间复杂度 O(n^2)
    // 空间复杂度 O(1)
    class Solution {
        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            let count = nums.count
            for i in 0..<(count-1) {
                for j in 1..<count {
                    if nums[i] + nums[j] == target {
                        return [i, j]
                    }
                }
            }
            fatalError()
        }
    }

    test(Solution().twoSum)
}

do {
    // One-pass Hash Table
    // 单词循环，利用字典查询并记录之前数字的位置，满足条件就及早退出
    // 时间复杂度 O(n)
    // 空间复杂度 O(n)
    class Solution {
        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            var cache: [Int: Int] = [:]
            for (currentIndex, num) in nums.enumerated() {
                if let previousIndex = cache[target - num] {
                    return [previousIndex, currentIndex]
                }
                cache[num] = currentIndex
            }
            fatalError()
        }
    }

    test(Solution().twoSum)
}

print("end")

//: [Next](@next)
