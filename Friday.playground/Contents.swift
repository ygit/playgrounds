import Foundation

func allConstruct(target: String, bank: [String], memo: inout [String: [[String]]]) -> [[String]]? {
    
    if target.isEmpty {
        return [[String]]()
    }
    
    for word in bank {
        if target.hasPrefix(word) {
            let suffix = String(target.dropFirst(word.count))
            if let suffixWays = allConstruct(target: suffix, bank: bank, memo: &memo) {
                let targetWays = suffixWays.map { (way) -> [String] in
                    var way = way
                    way.insert(word, at: 0)
                    return way
                }
                
            }
        }
    }
    
    return nil
}

//func allConstruct(target: String, bank: [String], memo: inout [String: [[String]]]) -> [[String]]? {
////    print(memo)
//    if let result = memo[target] {
//        return result
//    }
//
//    if target.isEmpty {
//        return [[String]]()
//    }
//
//    if bank.isEmpty {
//        return nil
//    }
//
//    var combinations = [String]()
//
//    for word in bank {
//        if target.hasPrefix(word) {
//            let suffix = String(target.dropFirst(word.count))
//
//
//            if let suffixWays = allConstruct(target: suffix, bank: bank, memo: &memo) {
//                var targetWays = [String]()
//                print(target, word, suffix, suffixWays)
//                for var way in suffixWays {
//                    way.insert(word, at: 0)
//                    targetWays += way
//                }
//                combinations += targetWays
//            }
//        }
//    }
//
////    memo[target] = combinations
////    return combinations
//    return [combinations]
//}
//
//var memo = [String: [[String]]]()
//allConstruct(target: "abc", bank: ["a", "b", "c", "bc", "df"], memo: &memo)


//func countConstruct(target: String, bank: [String], memo: inout [String: Int]) -> Int {
//
//    if let result = memo[target] {
//        return result
//    }
//
//    if target.isEmpty {
//        return 1
//    }
//
//    if bank.isEmpty {
//        return 0
//    }
//
//    var count = 0
//
//    for word in bank {
//        if target.hasPrefix(word) {
//            let remainder = String(target.dropFirst(word.count))
//            let result = countConstruct(target: remainder, bank: bank, memo: &memo)
//            memo[remainder] = result
//            count += result
//        }
//    }
//
//    memo[target] = count
//
//    return count
//}

//var memo = [String: Int]()
//countConstruct(target: "abc", bank: ["a", "b", "c", "bc", "df"], memo: &memo)
//countConstruct(target: "purple", bank: ["pu", "r", "rp", "ple", "p", "le"], memo: &memo)
//countConstruct(target: "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef", bank: ["e", "eeee", "eeeeeee"], memo: &memo)


//func canConstruct(string: String, words: [String], memo: inout [String: Bool]) -> Bool {
//
//    if let result = memo[string] {
//        return result
//    }
//
//    if string.isEmpty {
//        return true
//    }
//
//    if words.isEmpty {
//        return false
//    }
//
//    for word in words {
//        if string.hasPrefix(word) {
//            let remainder = String(string.dropFirst(word.count))
//            let result = canConstruct(string: remainder, words: words, memo: &memo)
//            memo[remainder] = result
//            if result {
//                return result
//            }
//        }
//    }
//
//    memo[string] = false
//    return false
//}
//
//var memo = [String: Bool]()

//canConstruct(string: "abc", words: ["a", "bc", "cd"], memo: &memo)
//canConstruct(string: "skateboard", words: ["sk", "dc"], memo: &memo)
//canConstruct(string: "eeeeeeeeeeeeeeeeeeeeeeeeeeef", words: ["e", "eee", "eeeeee", "eee"], memo: &memo)


//func bestSum(numbers: [Int], target: Int, memo: inout [Int: [Int]]) -> [Int]? {
//
//    if let result = memo[target] {
//        return result
//    }
//
//    if target == 0 {
//        return [Int]()
//    }
//
//    if target < 0 {
//        return nil
//    }
//
//    var shortestCombination: [Int]?
//
//    for number in numbers {
//        let remainder = target - number
//
//        if var combination = bestSum(numbers: numbers, target: remainder, memo: &memo) {
//            combination.append(number)
//
//            if shortestCombination == nil || combination.count < shortestCombination?.count ?? 0 {
//                shortestCombination = combination
//            }
//        }
//    }
//
//    memo[target] = shortestCombination
//
//    return shortestCombination
//}
//
//var memo = [Int: [Int]]()

//bestSum(numbers: [2,3,5], target: 8, memo: &memo)
//bestSum(numbers: [1,2,5,25], target: 100, memo: &memo)

//let sacks = [(6, 30), (3, 14), (4, 16), (2, 9)]
//
////let W = 1
//
//func knapsack(sacks: [(Int, Int)], maxWeight: Int) -> Int {
//
//    var values = [Int: Int]()
//
//    values[0] = 0
//
//    for w in 0...maxWeight {
////        values[w] = 0
//        for (weight, cost) in sacks {
//            print(w, weight, cost)
//            if weight <= w {
//                let value = values[w - weight] ?? 0 + cost
//                let currentValue = values[w] ?? 0
//                if value > currentValue {
//                    values[w] = value
//                }
//            }
//        }
//    }
//    print(values)
//    return values[maxWeight] ?? 0
//}
//
//knapsack(sacks: sacks, maxWeight: 10)
