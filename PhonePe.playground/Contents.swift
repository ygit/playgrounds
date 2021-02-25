import Foundation

func howSum(_ numbers: [Int], target: Int, memo: inout [Int: [Int]]) -> [Int]? {
//    print(memo)
    if memo[target] != nil {
        return memo[target]
    }
    
    if target < 0 {
        return nil
    }
    
    if target == 0 {
        return [Int]()
    }
    
    for number in numbers {
        
        let remainder = target - number
        
        var result = howSum(numbers, target: remainder, memo: &memo)
        
        if result != nil {
            result?.append(number)
            memo[target] = result
            return result
        }
    }
    
    memo[target] = nil
    return nil
}

var memo = [Int: [Int]]()

//howSum([2,3], target: 5, memo: &memo)
//howSum([4,4,2,6], target: 6, memo: &memo)
//howSum([7,14], target: 300, memo: &memo)

//func canSum(_ numbers: [Int], target: Int, _ memo: inout [Int: Bool]) -> Bool {
//
//    print(memo)
//    if let result = memo[target] {
//        return result
//    }
//
//    if target == 0 {
//        return true
//    }
//
//    if numbers.contains(target) {
//        return true
//    }
//
//    if target < 0 {
//        return false
//    }
//
//    if target < numbers.min()! {
//        return false
//    }
//
//    for number in numbers {
//        let remainingTarget = target - number
//        if canSum(numbers, target: remainingTarget, &memo) {
//            memo[target] = true
//            return true
//        }
//    }
//
//    memo[target] = false
//
//    return false
//}
//
//var memo = [Int: Bool]()
//
//canSum([7,14], target: 300, &memo)
