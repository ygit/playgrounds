import Foundation

func gridTraveler(start: Int, end: Int, memo: inout [String: Int]) -> Int {
    
    if let value = memo["\(start)"  + "," +  "\(end)"] {
        return value
    }
    
    if let value = memo["\(end)" + "," + "\(start)" ] {
        return value
    }
    
    if start == 0 || end == 0 {
        return 0
    }
    if start == 1 && end == 1 {
        return 1
    }
    
    memo["\(start)" + "," + "\(end)"] = gridTraveler(start: start-1, end: end, memo: &memo) + gridTraveler(start: start, end: end - 1, memo: &memo)
    return memo["\(start)"  + "," +  "\(end)"]!
}

var map = [String: Int]()

//gridTraveler(start: 3, end: 3, memo: &map)
gridTraveler(start: 18, end: 18 , memo: &map)

//func fibonacciMemo(_ n: Int, map: inout [Int: Int]) -> Int {
//
//    if let value = map[n] {
//        return value
//    }
//
//    if n <= 2 {
//        return 1
//    }
//
//
//    map[n] = fibonacciMemo(n - 1, map: &map) + fibonacciMemo(n - 2, map: &map)
//    return map[n]!
//}
//
//var map = [Int: Int]()
//
//fibonacciMemo(51, map: &map)

//func fibonacciMemo(_ n: Int, map: [Int: Int] = [:]) -> Int {
//
//    if let value = map[n] {
//        return value
//    }
//
//    if n <= 2 {
//        return 1
//    }
//
//    var map = map
//
//    map[n] = fibonacciMemo(n - 1, map: map) + fibonacciMemo(n - 2, map: map)
//    return map[n]!
//}

fibonacciMemo(8)

//func quickSort(_ array: inout [Int], left: Int, right: Int) -> [Int] {
//
//    if left >= right {
//        return [Int]()
//    }
//
//    let index = getIndex(&array, left: left, right: right)
//
//    quickSort(&array, left: left, right: index - 1)
//    quickSort(&array, left: index + 1, right: right)
//
//    return array
//}
//
//func getIndex( _ array: inout [Int], left: Int, right: Int) -> Int {
//
//    let target = array[left]
//    var j = left
//
//    for i in left+1..<right {
//        if array[i] <= target {
//            j += 1
//            let temp = array[j]
//            array[j] = array[i]
//            array[i] = temp
//        } else {
//            let temp = array[left]
//            array[left] = array[j]
//            array[j] = temp
//        }
//    }
//    return j
//}

//func quickSort(_ array: [Int]) -> [Int] {
//    guard array.count > 1 else {
//        return array
//    }
//
//    let pivot = array.first!
//    let less = array.filter { $0 < pivot }
//    let equal = array.filter { $0 == pivot }
//    let more = array.filter { $0 > pivot }
//
//    return quickSort(less) + equal + quickSort(more)
//}
//
//var arr = [3, 2, 5,7, 89,41,34,56,42,2,1,]
//quickSort(arr)

//func polynomialMultiplication(_ num1: [Int], _ num2: [Int]) -> [Int] {
//
//    var result = [Int]()
//
//    for (index, n1) in num1.enumerated() {
//        for (anotherIndex, n2) in num2.enumerated() {
//
//            let product = n1 * n2
//
//            let newIndex = index + anotherIndex
//
//            if newIndex < result.count {
//                let existingElementAtIndex = result[newIndex]
//                let newProduct = existingElementAtIndex + product
//                result[newIndex] = newProduct
//            } else {
//                result.insert(product, at: newIndex)
//            }
//        }
//    }
//    return result
//}

//polynomialMultiplication([3, 2, 5], [5, 1, 2])
//polynomialMultiplication([4,3,2,1], [1,2,3,4])
//polynomialMultiplication([5, 3, 4, 1], [0, 6, 0, 5])

//func recursiveLinearSearch(_ array: [Int], low: Int, high: Int, key: Int) -> Int? {
//
//    if high < low {
//        return nil
//    }
//
//    if array[low] == key {
//        return low
//    }
//
//    if array[high] == key {
//        return high
//    }
//
//    return recursiveLinearSearch(array, low: low + 1, high: high - 1, key: key)
//}
//
//print(recursiveLinearSearch([1,2,3], low: 0, high: 2, key: 4) ?? "nil")

//func findCode(_ string: String, key: String) -> Bool {
//
//    let keyArray = Array(key)
//
//    let string = Array(string)
//
//    var keyIndex = 0
//
//    var anotherIndex = 0
//
//    var foundKey = ""
//
//    while anotherIndex < string.count && keyIndex < keyArray.count {
//
//        let character = keyArray[keyIndex]
//
//        let charInString = string[anotherIndex]
//
//        if charInString == character {
//            foundKey += "\(character)"
//            keyIndex += 1
//        }
//
//        anotherIndex += 1
//    }
//
//    return foundKey == key
//}
//
//findCode("pqsoiwoqcrldfweiqwssdcdvkdmshvdf", key: "swordfish")

//func binarySearch(_ numbers: [Int], target: Int) -> Int? {
//
//    let numbers = numbers.sorted()
//
//    var low = 0
//    var high = numbers.count - 1
//
//    while low <= high {
//
//        let mid = (high + low) / 2
//
//        let midNumber = numbers[mid]
//
//        if midNumber == target {
//            return mid
//        } else if target < midNumber {
//            high = mid - 1
//        } else if target > midNumber {
//            low = mid + 1
//        } else {
//            return nil
//        }
//    }
//    return nil
//}
//
//binarySearch([1,2,3, 4,5,6,8], target: 7)

//let children = [1,2,3,1,3,4,5,7]
//let groups = [[1,2,1],[3,3,4],[5],[7]]
//
//func getGrouping(_ children: [Int]) -> Int {
//
//
//}
//
//getGrouping(children)

//func getGrouping(_ children: [Int]) -> Int {
//
//    let lastChild = children.count
//
//    var startingPoint = 0
//    var currentChild = 1
//
//    var groups = 0
//
//    while currentChild < lastChild {
//
//        if children[currentChild] - children[startingPoint] > 1 {
//            startingPoint = currentChild
//            groups += 1
//        }
//
//        if currentChild == lastChild - 1 {
//            groups += 1
//        }
//
//        currentChild += 1
//    }
//
//    return groups
//}
//
//getGrouping(children)

//func getGrouping(_ children: [Int]) -> [Int] {
//
//    guard children.count > 0 else {
//        return [Int]()
//    }
//
//    var children = children
//
//    var group = [Int]()
//
//    for (index, child) in children.enumerated() {
//
//        var counter = index + 1
//        group.append(child)
//
//        while counter < children.count {
//
//            let anotherChild = children[counter]
//
//            if child - anotherChild <= 1 {
//                group.append(anotherChild)
//                counter += 1
//            }
//
//            counter += 1
//        }
//
//    }
//    return group
//}
//
//getGrouping(children)

//func getGrouping(_ children: [Int]) -> [[Int]] {
//
//    var children = children
//
//
//    for (index, child) in children.enumerated() {
//
//        let ageGroup = child + 1
//
//        var counter = index + 1
//
//        var grouping = [Int]()
//        grouping.append(child)
//
//        while counter < children.count {
//
//            let age = children[counter]
//
//            if age <= ageGroup {
//                grouping.append(age)
//            }
//
//            counter += 1
//        }
//    }
//}

//func getGrouping(children: [Int]) -> [[Int]] {
//
//    var children = children
//
//    var groups = [[Int]]()
//
//    for (index, child) in children.enumerated() {
//
//        var currentGroup = [Int]()
//        currentGroup.append(child)
//
//        var counter = index + 1
//
//        while counter < children.count {
//
//            let anotherChild = children[counter]
//
//            if anotherChild - child <= 1 {
//                currentGroup.append(anotherChild)
//                children.remove(at: counter)
//            }
//
//            counter += 1
//        }
//        print(currentGroup)
////        groups.append(currentGroup)
//    }
//    return groups
//}



//func getLargestNumber(_ string: String) -> String {
//
//    guard string.count > 0 else {
//        return ""
//    }
//
//    var array = string.compactMap { Int(String($0)) }
//
//    var largestNumber = array.first!
//    var largestNumberIndex = 0
//
//    for (index, number) in array.enumerated() {
//
//        if number > largestNumber {
//            largestNumber = number
//            largestNumberIndex = index
//        }
//    }
//
//    array.remove(at: largestNumberIndex)
//
//    let newArray = array.map { String($0) }
//
//    let newString = newArray.joined()
//
//    print(largestNumberIndex, largestNumber, newString)
//
//    return "\(largestNumber)" + getLargestNumber(newString)
//}
//
//print(getLargestNumber("1984830102319848312345678900102312345678123456789090"))
//getLargestNumber("1234567890")
    
//    print(string)
//
//    guard !string.isEmpty else {
//        return ""
//    }
//
//    var array = Array(string)
//
//    var largestNumber = array.first!
//    var largestNumberIndex = 0
//
//    for (index, number) in array.enumerated() {
//
//        if number > largestNumber {
//            largestNumber = number
//            largestNumberIndex = index
//        }
//    }
//
//    array.remove(at: largestNumberIndex)
//
//    let newArray = array.compactMap { "\($0)" }
//
//    print(newArray)
//
//    return "\(largestNumber)" + getLargestNumber(newArray.description)
    
//    let array = Array(string.map { Int("\($0)")! })
//
//    let sortedArray = array.sorted()
//
//    let largestArray = sortedArray.reversed()
//
//    var largestNumber = ""
//
//    for number in largestArray {
//        largestNumber += "\(number)"
//    }
//
//    print(largestNumber)
//
//    return largestNumber
//    var counter = 0
    
//    while counter < array.count {
//
//        let pendingArray = Array(array[counter..<array.count])
//
//        let largestNumber = pendingArray.max()!
//
//        largestArray.append(largestNumber)
//
//        counter += 1
//    }
//}

//getLargestNumber("19848301023")

//func gcd(_ numerator: Int, _ denominator: Int) -> Int {
//
//    if denominator == 0 {
//        return numerator
//    }
//
//    return gcd(denominator, numerator%denominator)
//}
//
//gcd(357, 264)

//func gcd(_ numerator: Int, _ denominator: Int) -> Int {
//
//    var divider = 1
//    var gcd = 1
//
//    while divider <= min(numerator, denominator) {
//
//        if numerator % divider == 0 && denominator % divider == 0 {
//            gcd = divider
//        }
//
//        divider += 1
//    }
//
//    return gcd
//}

//gcd(128, 135)

//func fibonacciNumber(_ n: Int) -> Int {
//    var array = [Int]()
//    array.append(0)
//    array.append(1)
//
//    for number in 2...n {
//        array.append(array[number-1] + array[number-2])
//    }
//    return array[n]
//}
//
//fibonacciNumber(30)

//func fib(_ n: Int) -> Int {
//    guard n > 1 else { return n }
//    return fib(n-1) + fib(n-2)
//}
//
//fib(20)

//func fibonacciNumber(_ n: Int) -> Int {
//
//    guard n > 1 else {
//        return n
//    }
//
//    let sum = fibonacciNumber(n-1) + fibonacciNumber(n-2)
//
//    print(n, sum)
//
//    return sum
//}
//
//fibonacciNumber(1)

//func maximumPairwiseProduct(array: [Int]) -> Int? {
//
//    guard var maxProduct = array.first else {
//        return nil
//    }
//
//    for (index, number) in array.enumerated() {
//
//        var anotherIndex = index + 1
//
//        while anotherIndex < array.count {
//
//            let anotherNumber = array[anotherIndex]
//
//            let product = number * anotherNumber
//
//            if product > maxProduct {
//                maxProduct = product
//            }
//
//            anotherIndex += 1
//        }
//
//    }
//
//    return maxProduct
//}
//
//maximumPairwiseProduct(array: [5,6,7])
