import Foundation

/*
You are a developer for a university. Your current project is to develop a system for students to find courses they share with friends. The university has a system for querying courses students are enrolled in, returned as a list of (ID, course) pairs.

Write a function that takes in a collection of (student ID number, course name) pairs and returns, for every pair of students, a collection of all courses they share.

Sample Input:

student_course_pairs_1 = [
  ["58", "Linear Algebra"],
  ["94", "Art History"],
  ["94", "Operating Systems"],
  ["17", "Software Design"],
  ["58", "Mechanics"],
  ["58", "Economics"],
  ["17", "Linear Algebra"],
  ["17", "Political Science"],
  ["94", "Economics"],
  ["25", "Economics"],
  ["58", "Software Design"],
]

Sample Output (pseudocode, in any order):

find_pairs(student_course_pairs_1) =>
{
  "58,17": ["Software Design", "Linear Algebra"]
  "58,94": ["Economics"]
  "58,25": ["Economics"]
  "94,25": ["Economics"]
  "17,94": []
  "17,25": []
}



Additional test cases:

Sample Input:

student_course_pairs_2 = [
  ["42", "Software Design"],
  ["0", "Advanced Mechanics"],
  ["9", "Art History"],
]

Sample output:

find_pairs(student_course_pairs_2) =>
{
  "0,42": []
  "0,9": []
  "9,42": []
}



n: number of student,course pairs in the input
s: number of students
c: number of courses being offered
*/

import Foundation;

let student_course_pairs_1 : [[String]] = [
  ["58", "Linear Algebra"],
  ["94", "Art History"],
  ["94", "Operating Systems"],
  ["17", "Software Design"],
  ["58", "Mechanics"],
  ["58", "Economics"],
  ["17", "Linear Algebra"],
  ["17", "Political Science"],
  ["94", "Economics"],
  ["25", "Economics"],
  ["58", "Software Design"],

]

let student_course_pairs_2: [[String]] = [
  ["42", "Software Design"],
  ["0", "Advanced Mechanics"],
  ["9", "Art History"],
]

/*
func getPairs(_ pairs: [[String]]) -> [[String]] {
  
  var rollNumbers = [String: [String]]()
                     
  for pair in pairs {
    
    let rollNumber = pair[0] as String
    let subject = pair[1]

    if var existingSubject = rollNumbers[rollNumber] {
      existingSubject.append(subject)
      rollNumbers[rollNumber] = existingSubject
    } else {
      rollNumbers[rollNumber] = [subject]
    }
  }
                  
// print(rollNumbers)
  
  var result = [String: String]()
//   var set = Set<[String: String]>()
  
//   print(set)
  
//   let arrOfRolls = Array(rollNumbers)
//   print(arrOfRolls)
  
//   for student in arrOfRolls {
// //     print(student)
//     let currentRollNumber = student.key
//     let currentSubject = student.values
//     print(currentSubject)
//   }
  
  for (rollNumber, subjects) in rollNumbers {
//     print(rollNumber, subject)
    
//     var counter = 0
//     while counter < rollNumbers.count {
      
//       let anotherStudent = rollNumbers[counter]
//       print(anotherStudent)
      
//       counter += 1
//     }
    
    for (anotherRoll, anotherSubjects) in rollNumbers {
    
      if rollNumber != anotherRoll {
        
        for subject in subjects {
          if anotherSubjects.contains(subject) {
            
//             print(rollNumber, anotherRoll, subject)
            let key = rollNumber + ", " + anotherRoll
            let value = subject
//             set.insert()
            result[key] = value
          }
        }
//         if anotherSubject.containsSameElements(as: subject) {
//           print(rollNumber, anotherRoll, subject, anotherSubject)
//         }
      }
    }
//     let filter = rollNumbers.filter { $0.1.contains([subject) }
//     print(filter)
  }
  
  print(result)
  
//   for index in 0..<rollNumbers.count {
//     let currentStudent = rollNumbers[index]
//     let currentStudentSubjects = currentStudent.values
    
//     for anotherIndex in (index+1)..<rollNumbers.count {
//       let anotherStudent = rollNumbers[anotherIndex]
      
//       let anotherStudentSubjects = anotherStudent.values
      
//       print(currentStudentSubjects, anotherStudentSubjects)
//     }
//   }
  
  return [[String]]()
}
*/

/*
func getPairs(_ pairs: [[String]]) -> [String: [String]]{
    
    var map = [String: [String]]()
    
    for pair in pairs {
        let rollNumber = pair[0]
        let subject = pair[1]
        
        if var existingSubjects = map[rollNumber] {
            existingSubjects.append(subject)
            map[rollNumber] = existingSubjects
        } else {
            map[rollNumber] = [subject]
        }
    }
    
    var result = [String: [String]]()
    
    let rollNumbers = Array(map.keys)
    
    for (index, rollNumber) in rollNumbers.enumerated() {

        var anotherIndex = index + 1
        
        while anotherIndex < rollNumbers.count {
            
            let anotherRollNumber = rollNumbers[anotherIndex]
            
            var commonSubjects = [String]()
            
            if let anotherSubjects = map[anotherRollNumber], let currentSubjects = map[rollNumber] {
                commonSubjects = anotherSubjects.filter { currentSubjects.contains($0) }
            }
            
//            print(rollNumber, anotherRollNumber, commonSubjects)
            let key = rollNumber + ", " + anotherRollNumber
            
            result[key] = commonSubjects
            
            anotherIndex += 1
        }
    }
    
    return result
}
*/

struct StudCoursePair {
  var studentCode: Int
  var courseName: String
}

struct Pair {
  var students: [Int]
  var courseName: String
}

func decode(data: [[String]]) -> [StudCoursePair] {
  return data.compactMap { (arrayOfStrings) -> StudCoursePair? in
    guard arrayOfStrings.count >= 2, let studentCode = Int(arrayOfStrings[0]) else {
      return nil
    }
    let course = arrayOfStrings[1]
    return .init(studentCode: studentCode, courseName: course)
  }
}

func find_pairs(_ data: [[String]]) -> () {
  let sanitizedData = decode(data: data)
  let pairDicts: [String: [Int]] = sanitizedData.reduce(into: [:]) { (result, currentPair) in
    switch result[currentPair.courseName] {
    case .some(_):
      result[currentPair.courseName]?.append(currentPair.studentCode)
    case .none:
      result[currentPair.courseName] = [currentPair.studentCode]
    }
  }
  
  let pairs: [String: [(Int, Int)]] = pairDicts.reduce(into: [:]) { (result, pairDict) in
    let combinations = makePairCombinations(from: pairDict.value)
    combinations.forEach { (pair) in
      switch result[pairDict.key] {
      case .none:
        result[pairDict.key] = [pair]
      case .some(_):
        result[pairDict.key]?.append(pair)
      }
    }
    // For pairs who have more than 2
  }
  
  print(pairs)
}

func makePairCombinations(from values: [Int]) -> [(Int, Int)] {
  switch values.count {
  case 0,1: return []
  case 2: return [(values[0], values[1])] // shortcut
  default:
    return values.enumerated().reduce(into: []) { (result, iteration) in
      let diff = values.count - 1 - iteration.offset
      guard diff >= 1 else { return }
//      print("Diff: \(diff)")
      for i in 1...diff {
        let offset = iteration.offset
        result.append((iteration.element, values[i + offset]))
      }
    }
  }
  
}


print(find_pairs(student_course_pairs_1))
//print(getPairs(student_course_pairs_2))
  

//public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init() { self.val = 0; self.left = nil; self.right = nil; }
//    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
//    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
//        self.val = val
//        self.left = left
//        self.right = right
//    }
//}
//
//class Solution {
//    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
//
//        return sortedArrayToBST(nums, 0, nums.count - 1)
//    }
//
//    func sortedArrayToBST(_ nums: [Int], _ leftIdx: Int, _ rightIdx: Int) -> TreeNode? {
//        guard leftIdx <= rightIdx else {
//            return nil
//        }
//
//        let mid = (leftIdx - rightIdx) / 2 + leftIdx
//        let root = TreeNode(nums[mid])
//
//        root.left = sortedArrayToBST(nums, leftIdx, mid - 1)
//        root.right = sortedArrayToBST(nums, mid + 1, rightIdx)
//
//        return root
//    }
//}
//
//let solution = Solution()
//print(solution.sortedArrayToBST([0,1,2,3,4]))

    

//final class TreeNode {
//    var val: Int
//    var left: TreeNode?
//    var right: TreeNode?
//
//    init() {
//        val = 0
//        left = nil
//        right = nil
//    }
//
//    init(_ value: Int) {
//        self.val = value
//        left = nil
//        right = nil
//    }
//
//    init(_ value: Int, left: TreeNode?, right: TreeNode?) {
//        self.val = value
//        self.left = left
//        self.right = right
//    }
//}
//
//class Solution {
//    func levelOrder(_ root: TreeNode?) -> [[Int]] {
//        var result = [[Int]]()
//
//        guard let root = root else {
//            return result
//        }
//
//        var currentLevel = [root]
//
//        while !currentLevel.isEmpty {
//
//            let currentLevelVals = currentLevel.map { $0.val }
//
//            result.append(currentLevelVals)
//
//            currentLevel = currentLevel.flatMap { [$0.left, $0.right] }.compactMap { $0 }
//        }
//
//        return result
//    }
//}

//let root = TreeNode(3)
//root.left = TreeNode(0)
//root.right = TreeNode(20)
//root.right = TreeNode(1)

//let solution = Solution()
//solution.levelOrder(root)

//class Solution {
//    func levelOrder(_ root: TreeNode?) -> [[Int]] {
//        guard let root = root else { return [[Int]]() }
//
//        var order = [[Int]]()
//
//        order.append([root.value])
//
//        var child = [Int]()
//
//        if let leftOrder = helper(root.left) {
//            child.append(contentsOf: leftOrder)
//        }
//
//        if let rightOrder = helper(root.right) {
//            child.append(contentsOf: rightOrder)
//        }
//
//        if child.isEmpty {
//            return order
//        } else if child.count == 1 {
//            order.append([child.first!])
//        } else if child.count == 2 {
//            order.append([child.first!, child.last!])
//        }
//        return order
//    }
//
//    func helper(_ node: TreeNode?) -> [Int]? {
//
//        guard let node = node else { return nil }
//
//        var nodes = [Int]()
//
//        nodes.append(node.value)
//
//        if let left = node.left {
//            nodes.append(left.value)
//        }
//
//        if let right = node.right {
//            nodes.append(right.value)
//        }
//
//        return nodes
//    }
//}

//let root = TreeNode(3)
//root.left = TreeNode(0)
//root.right = TreeNode(20)
////root.right = TreeNode(1)
//
//let solution = Solution()
//solution.levelOrder(root)

//class Solution {
//    func isValidBST(_ root: TreeNode?) -> Bool {
//        return helper(node: root, min: nil, max: nil)
//    }
//
//    func helper(node: TreeNode?, min: Int?, max: Int?) -> Bool {
//        guard let node = node else { return true }
//
//        if let min = min, min >= node.value {
//            return false
//        }
//
//        if let max = max, max <= node.value {
//            return false
//        }
//
//        return helper(node: node.left, min: min, max: node.value) && helper(node: node.right, min: node.value, max: max)
//    }
//}

//let root = TreeNode(10)
//root.left = TreeNode(0)
//root.right = TreeNode(20)
//root.right = TreeNode(1)
//
//let solution = Solution()
//solution.isValidBST(root)


//class Solution {
//    func isValidBST(_ root: TreeNode?) -> Bool {
//
//        guard let root = root else { return true }
//
//        var leftTree = false
//
//        if let left = root.left {
//            if left.value < root.value {
//                leftTree = true
//            }
//        }
//
//        var rightTree = false
//
//        if let right = root.right {
//            if right.value > root.value {
//                rightTree = true
//            }
//        }
//
//        return leftTree && rightTree || isValidBST(root.left) || isValidBST(root.right)
//    }
//}

//let root = TreeNode(10)
//root.left = TreeNode(0)
//root.right = TreeNode(20)
//
//let solution = Solution()
//solution.isValidBST(root)


//class Solution {
//    func maxDepth(_ root: TreeNode?) -> Int {
//
//        guard let root = root else {
//            return 0
//        }
//
//        return max(maxDepth(root.left), maxDepth(root.right)) + 1
//    }
//}
//
//let root = TreeNode(0)
//root.left = TreeNode(1)
//root.right = TreeNode(2)
//root.left?.left = TreeNode(3)
//root.right?.right = TreeNode(4)
//root.right?.left = TreeNode(5)
//root.right?.right?.left = TreeNode(6)
//root.right?.right?.left?.right = TreeNode(7)
//
//let solution = Solution()
//solution.maxDepth(root)


//let pairs = [[1,3], [2,3], [3,6], [5,6], [15, 9], [5, 7], [4, 5], [4, 8], [4, 9], [9, 11]]
//
//struct Node<Value> {
//    var value: Value
//    var children: [Node]
//
//    init(_ value: Value) {
//        self.value = value
//        children = []
//    }
//
//    init(value: Value, children: [Node]) {
//        self.value = value
//        self.children = children
//    }
//
//    mutating func add(child: Node) {
//        children.append(child)
//    }
//}
//
//extension Node: Equatable where Value: Equatable {
//    func find(_ value: Value) -> Node? {
//        if self.value == value {
//            return self
//        }
//
//        for child in children {
//            if let match = child.find(value) {
//                return match
//            }
//        }
//
//        return nil
//    }
//}
//
//func getPairs(_ pairs: [[Int]]) -> [[Int]] {
//
//    var nodes = [Node<Int>]()
//
//    for pair in pairs {
//        let value = pair[0]
//        let node = Node(value)
//        nodes.append(node)
////        print(nodes)
//    }
//
//    for pair in pairs {
//        let parent = pair[0]
//
//        let child = pair[1]
//
//        let parentNode = nodes.filter { $0.value == parent }
//
//        print(parent, child, parentNode)
//    }
//
//
//
//    return [[Int]] ()
//}
//
//
//func getPairs(_ pairs: [[Int]]) -> [[Int]] {
//
//    var nodes = [Node]()
//    var childNodes = [Node]()
//
//    for pair in pairs {
//        let value = pair[0]
//        let childValue = pair[1]
//        let childNode = Node(childValue)
//        let node = Node(value: value, children: [childNode])
//        nodes.append(node)
//        childNodes.append(childNode)
////        print(node)
//    }
//
//
//    var zeroParentNodes = Set<Int>()
//
//    for node in nodes {
//        if !childNodes.contains(node) {
//            zeroParentNodes.insert(node.value)
//        }
//    }
//
//    var singleParentNodes = Set<Int>()
//    var doubleParentNodes = Set<Int>()
//
//
//    for child in childNodes {
//        let occurences = childNodes.filter { child.value == $0.value }
//
//        if occurences.count == 1 {
//            singleParentNodes.insert(child.value)
//        } else if occurences.count == 2 {
//            doubleParentNodes.insert(child.value)
//        }
//    }
//    return [Array(zeroParentNodes), Array(singleParentNodes), Array(doubleParentNodes)]
//}
//
//let p = [
//  [1, 3],
//  [2, 3],
//  [3, 6],
//  [5, 6],
//  [5, 7],
//  [4, 5],
//  [4, 8],
//  [8, 10]
//]
//
//getPairs(pairs)

//var nodes = [Node]()

//func getPairs(_ pairs: [[Int]]) -> [[Int]] {
//
//    for pair in pairs {
//        let value = pair[0]
//        let child = pair[1]
//
////        print(pair)
//
//        var node = nodes.filter { $0.value == value }
//
//        if node.isEmpty {
//            let childNode = Node(value: child, childNode: nil)
//
//            node = [Node(value: value, childNode: [childNode])]
//
//            nodes.append(contentsOf: node)
//        } else {
//            print(pair)
//            print(node)
//
////            print(pair)
//
//        }
//    }
//
////    print(nodes.sorted { $0.value < $1.value })
//
//    return [[Int]]()
//}



//class Solution {
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//
//        var result = [[Int]]()
//
//        guard nums.count > 3 else {
//            let res = [nums]
//            return res
//        }
//
//        let nums = nums.sorted()
//
//        for i in 0..<nums.count - 2 {
//
//            if i > 0 && nums[i] == nums[i - 1] {
//                continue
//            }
//
//            let firstNum = nums[i]
//            let remainingSum = -firstNum
//            var m = i + 1
//            var n = nums.count - 1
//
//            while m < n {
//
//                if nums[m] + nums[n] == remainingSum {
//                    result.append([firstNum, nums[m], nums[n]])
//
//                    repeat {
//                        m += 1
//                    } while nums[m] == nums[m - 1] && m < n
//
//                    repeat {
//                        n -= 1
//                    } while nums[n] == nums[n + 1] && m < n
//                }
//                else if nums[m] + nums[n] < remainingSum {
//                    m += 1
//                } else {
//                    n -= 1
//                }
//            }
//        }
//
//        return result
//    }
//}

//let solution = Solution()
//solution.threeSum([-1,0,1,2,-1,-4])


//let data: [Any?] = ["Bill", nil, 69, "Ted"]
//
//for datum in data where datum is String? {
//    print(datum)
//}
//
//for case let .some(datum) in data where datum is String {
//    print(datum)
//}

//var first = [1, 2, 3]
//var second = ["one", "two", "three"]
//var third = Array(zip(first, second))
//print(third)

//func getNumber() -> Int {
//    print("Fetching number...")
//    return 5
//}
//
//func printStatement(_ result: @autoclosure () -> Bool) {
//    // print("Here is the number: \(result())")
//    print("Nothing to see here.")
//}
//
//printStatement(getNumber() == 5)

//let numbers = [1, 2, 3].flatMap { [$0, $0] }
//print(numbers)

//for i in stride(from: 1, to: 17, by: 4) {
//    print(i)
//}

//let bigNumber = Int.max
//let biggerNumber = bigNumber + 1
//print(biggerNumber)

//enum Direction: CaseIterable {
//    case north, south, east, west
//}
//
//print(Direction.allCases.count)

//class Solution {
//    func validPalindrome(_ s: String) -> Bool {
//
//        let lowercasedString = s.lowercased()
//        return false
//    }
//}
//
//"ABC" == "abc"

//class ThreeSum {
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//        var res = [[Int]]()
//
//        guard nums.count >= 3 else {
//            return res
//        }
//
//        let nums = nums.sorted()
//
//        for i in 0..<nums.count - 2 {
//            if i > 0 && nums[i] == nums[i - 1] {
//                continue
//            }
//
//            let firstNum = nums[i], remainingSum = -firstNum
//            var m = i + 1, n = nums.count - 1
//
//            while m < n {
//                if nums[m] + nums[n] == remainingSum {
//                    res.append([firstNum, nums[m], nums[n]])
//
//                    repeat {
//                        m += 1
//                    } while nums[m] == nums[m - 1] && m < n
//
//                    repeat {
//                        n -= 1
//                    } while nums[n] == nums[n + 1] && m < n
//                } else if nums[m] + nums[n] < remainingSum {
//                    m += 1
//                } else {
//                    n -= 1
//                }
//            }
//        }
//
//        return res
//    }
//}

//let solution = ThreeSum()
//solution.threeSum([-14,-3,11,-3,12,-1,11,13,5,6,-11,-14,-6,11,-4,-15,3,-15,9,-10,13,-10,-9,-13,-12,12,-7,12,12,3,9,5,-14,-3,9,13,11,5,3,-6,-12,-1,-5,-3,-4,-2,-10,6,-10,14,3,-11,11,10,-9,7,-1,-9,4,-12,2,-2,8,3,3,-6,-7,-1,6,12,8,9,-12,10,-8,-1,-7,-3,12,-9,-12,1,-5,6,-12,-7,-2,2,-8,-13,5,9,-7,-10,-3,11,-1,-3,-13,-10,-14,11,6,-10,6,13,4,7,-13,-6,13,12,10,-15,4,13,-7,9,-8,0,4,4,-6,12,9,-2,0])


//extension Character {
//    var isValid: Bool {
//        return isLetter || isNumber
//    }
//}
//
//class Solution {
//    func isPalindrome(_ s: String) -> Bool {
//
//        var i = 0, j = s.count - 1
//        let array = Array(s.lowercased())
//
//        while i < j {
//
//            while !array[i].isValid && i < j {
//                i += 1
//            }
//
//            while !array[j].isValid && i < j {
//                j -= 1
//            }
//
//            if array[i] != array[j] {
//                return false
//            }
//            i += 1
//            j -= 1
//        }
//        return true
//    }
//}

//let solution = Solution()
//solution.isPalindrome("A man a plan a canal: Panama")

//        let lowerCasedString = s.lowercased()
//
//        let filteredString = lowerCasedString.filter { "abcdefghijklmnopqrstuvxyz".contains($0) }
//
//        let filteredArray = Array(filteredString)
//
//        let midIndex = filteredArray.count / 2
//
//        let isEven = filteredArray.count % 2 == 0
//
//        let leftArray = Array(filteredArray[0..<midIndex])
//
//        let rightArray = Array(filteredArray[(midIndex+1)...])
//
//        print(filteredArray, midIndex, leftArray, rightArray, isEven)
        
//        return false
//        guard s.isEmpty else {
//            return true
//        }
//
//        let lowerCasedString = s.lowercased()
//
//        let filteredString = lowerCasedString.filter { "abcdefghijklmnopqrstuvwxyz".contains($0) }
//
//        guard filteredString.count > 1 else {
//            return false
//        }
//
//        let reversedString = String(filteredString.reversed())
//        print(reversedString, filteredString)
//        return (reversedString == filteredString)
//    }
//}

//let solution = Solution()
//solution.isPalindrome("Aa man, a plan, a canal: Panamaa")


//class Solution {
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//
//        var i = 0
//
//        var sum = [[Int]]()
//
//        while i < nums.count {
//
//            var j = i + 1
//
//            while j < nums.count {
//
//                var k = j + 1
//
//                while k < nums.count {
//
//                    if nums[i] + nums[j] + nums[k] == 0 {
//                        print(nums[i], nums[j], nums[k])
//                        let array = [nums[i], nums[j], nums[k]].sorted()
//                        if !sum.contains(array) {
//                            sum.append(array)
//                        }
//                    }
//                    k += 1
//                }
//                j += 1
//            }
//
//            i += 1
//        }
//
//
//        print("Final: ", sum)
//
//        return sum
//    }
//}

//let solution = Solution()
//solution.threeSum([-1,0,1,2,-1,-4])
//solution.threeSum([-14,-3,11,-3,12,-1,11,13,5,6,-11,-14,-6,11,-4,-15,3,-15,9,-10,13,-10,-9,-13,-12,12,-7,12,12,3,9,5,-14,-3,9,13,11,5,3,-6,-12,-1,-5,-3,-4,-2,-10,6,-10,14,3,-11,11,10,-9,7,-1,-9,4,-12,2,-2,8,3,3,-6,-7,-1,6,12,8,9,-12,10,-8,-1,-7,-3,12,-9,-12,1,-5,6,-12,-7,-2,2,-8,-13,5,9,-7,-10,-3,11,-1,-3,-13,-10,-14,11,6,-10,6,13,4,7,-13,-6,13,12,10,-15,4,13,-7,9,-8,0,4,4,-6,12,9,-2,0])


//class Solution {
//    func plusOne(_ digits: [Int]) -> [Int] {
//
//        var digits = digits
//
//        var index = digits.count - 1
//
//        while index >= 0 {
//
//            if digits[index] < 9 {
//                digits[index] += 1
//                return digits
//            }
//            digits[index] = 0
//            index -= 1
//        }
//        digits.insert(1, at: 0)
//        return digits
        
        
//        var digits = digits
//        var index = digits.count - 1
//
//        while index >= 0 {
//            if digits[index] < 9 {
//                digits[index] += 1
//                return digits
//            }
//
//            digits[index] = 0
//            index -= 1
//        }
//
//        digits.insert(1, at: 0)
//        return digits
        
//        let numberString = digits.reduce("") { $0 + "\($1)" }
//        let numberInt = Int(numberString) ?? 0
//        let incrementedNumber = numberInt + 1
//        let incrementedString = "\(incrementedNumber)"
//        let plusOneArrayString = Array(incrementedString)
//        let plusOneArrayInt = plusOneArrayString.map { Int("\($0)")! }
//
//        return plusOneArrayInt
//    }
//}
//
//let solution = Solution()
//solution.plusOne([9])


//class Solution {
//    func isPalindrome(_ s: String) -> Bool {
//
//        let lowerCasedString = s.lowercased()
//
//        let filteredString = lowerCasedString.filter { "abcdefghijklmnopqrstuvwxyz".contains($0) }
//
//        guard filteredString.count > 1 else {
//            return false
//        }
//
//        let reversedString = String(filteredString.reversed())
//        return (reversedString == filteredString)
//    }
//}

//let solution = Solution()
//solution.isPalindrome("A man, a plan, a canal: Panama")
//solution.isPalindrome("0P")
//solution.isPalindrome("")


//class Solution {
//    func productExceptSelf(_ nums: [Int]) -> [Int] {
//
//        var products = [Int]()
//        var mutableArray = nums
//
//        for index in 0..<nums.count {
//
//            let elementAtIndex = mutableArray[index]
//
//            mutableArray[index] = 1
//
//            let product = mutableArray.reduce(1) { $0 * $1 }
//
//            products.append(product)
//
//            mutableArray[index] = elementAtIndex
//        }
//
//        return products
//
//        for (index, _) in nums.enumerated() {
//            let leftArray = index > 0 ? Array(nums[0..<index]) : [Int]()
//            let rightArray = (index+1) < nums.count ? Array(nums[(index+1)...]) : [Int]()
//
//            let leftProduct = leftArray.reduce(1) { $0 * $1 }
//            let rightProduct = rightArray.reduce(1) { $0 * $1 }
//            products.append(leftProduct*rightProduct)
//        }
//        return products
        
//        var products = [Int]()
//        for number in nums {
//            if number != 0 {
//                let product = nums.reduce(1) { $0 * $1 }
//                let division = product/number
//                products.append(division)
//            } else {
//                products.append(0)
//            }
//        }
//        return products
//    }
//}

//let solution = Solution()
//solution.productExceptSelf([1,2,3,4])


//class Solution {
//    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
//
//        nums1.removeSubrange(m...)
//        var mutableNums2 = nums2
//        mutableNums2.removeSubrange(n...)
//
//        let num = nums1 + nums2
//        nums1 = num.sorted()
//    }
//}
//
//let solution = Solution()
//var nums1 = [1,2,3,6]
//let nums2 = [4,5,7]
//solution.merge(&nums1, 4, nums2, 3)
//print(nums1)


//class Solution {
//    func firstBadVersion(_ n: Int) -> Int {

//        var badVersions = [Int]()
//
//        while n > 0 {
//            if isBadVersion(n) {
//                badVersions.append(n)
//            }
//            n -= 1
//        }
//
//        badVersions = badVersions.sorted()
//        return badVersions.first
//    }
//}

//class Solution {
//    func longestCommonPrefix(_ strs: [String]) -> String {
//
//        var counter = 0
//
//        while counter < strs.count {
//
//            let word = strs[counter]
//
//            let filter = strs.filter { $0.hasPrefix(word) }
//
//            print(filter)
//
//            counter += 1
//        }
//
//
//        return ""
//    }
//}
//
//let solution = Solution()
//solution.longestCommonPrefix(["flower","flow","flight"])


//class Solution {
//    func reverse(_ x: Int) -> Int {
//
//        var string = "\(x)"
//        var shouldAppendMinusSign = false
//
//        if string.contains("-") {
//            shouldAppendMinusSign = true
//            string = string.replacingOccurrences(of: "-", with: "")
//        }
//
//        let reversedString = String(string.reversed())
//
//        let reversedNumber = Double(reversedString) ?? 0.0
//
//        var clampedNumber = reversedNumber
//
//        if reversedNumber < pow(-2, 31) || reversedNumber > (pow(2, 31) - 1) {
//            clampedNumber = 0
//        }
//
//        return shouldAppendMinusSign ? -Int(clampedNumber) : Int(clampedNumber)
//    }
//}

//let solution = Solution()
//solution.reverse(123)
//solution.reverse(-123)
//solution.reverse(1534236469)


//class Solution {
//    func strStr(_ haystack: String, _ needle: String) -> Int {
//        let hChars = Array(haystack), nChars = Array(needle)
//        let hLen = hChars.count, nLen = nChars.count
//
//        guard hLen >= nLen else {
//            return -1
//        }
//        guard nLen != 0 else {
//            return 0
//        }
//
//        for i in 0...hLen - nLen {
////            print(i, hChars[i], nChars[0])
//            if hChars[i] == nChars[0] {
//                for j in 0..<nLen {
//                    print(i, j, hChars[i + j], nChars[j])
//                    if hChars[i + j] != nChars[j] {
//                        break
//                    }
//                    if j + 1 == nLen {
//                        return i
//                    }
//                }
//            }
//        }
//
//        return -1
//    }
//}

//class Solution {
//    func strStr(_ haystack: String, _ needle: String) -> Int {
//
//        if haystack.isEmpty {
//            return needle.isEmpty ? 0 : -1
//        }
//
//        if needle.isEmpty {
//            if !haystack.isEmpty {
//                return 0
//            }
//        }
//
//        guard haystack.contains(needle) else {
//            return -1
//        }
//
//        let haystackArray = Array(haystack)
//        let needleArray = Array(needle)
//
//        let array = haystackArray - needleArray
//
//
////        for (index, character) in haystack.enumerated() {
////            if needle.contains(character) {
////                return index
////            }
////        }
//
//        return 0
//    }
//}

//let solution = Solution()
//solution.strStr("hello", "ll")
//solution.strStr("hello", "a")
//solution.strStr("", "")
//solution.strStr("", "a")
//solution.strStr("a", "")
//solution.strStr("mississippi", "issip")


//class Solution {
//    func myAtoi(_ s: String) -> Int {
//
//        var stringWithoutSpaces = ""
//
//        for character in s {
//            if character == " " {
//                if stringWithoutSpaces.count > 0 {
//                    break
//                }
//            } else {
//                stringWithoutSpaces += "\(character)"
//            }
//        }
//
//        let alphabets = [Character]("abcdefghijklmnopqrstuvwxyz")
//
//        var validString = ""
//
//        for (index, character) in stringWithoutSpaces.enumerated() {
//            if alphabets.contains(character)  {
//                if index == 0 {
//                    return 0
//                } else if validString.count > 0 {
//                    break
//                }
//            } else {
//                validString += "\(character)"
//            }
//        }
//
////        let cleanedString = validString.filter { "0123456789_.+-".contains($0) }
//
//        var cleanedString = ""
//
//        for character in validString {
//            if "0123456789_.+-".contains(character) {
//                switch character {
//                case "-":
//                    if validString.contains("-") {
//                        break
//                    }
//                default:
//                    cleanedString += "\(character)"
//                }
//
//            }
//        }
//
//        print(cleanedString)
//
//        guard let number = Double(cleanedString) else { return 0 }
//
//        let clampedNumber = min(max(number, -2147483648), 2147483647)
//
//        return Int(clampedNumber)
//    }
//}

//let solution = Solution()
//solution.myAtoi("987 with words")
//solution.myAtoi("words with 987")
//solution.myAtoi("-91283472332")
//solution.myAtoi("3.14159")
//solution.myAtoi("  -0012a42")
//solution.myAtoi("   +0 123")
//solution.myAtoi("-5-")



//class Solution {
//    func firstUniqChar(_ s: String) -> Int {
//        var dictionary = [Character: Int]()
//        for character in s {
//            let count = (dictionary[character] ?? 0) + 1
//            dictionary[character] = count
//
//        }
//
//        let uniqueCharacters = dictionary.filter { $0.value == 1 }.keys
//
//        let uniqueCharacter = s.filter { uniqueCharacters.contains($0) }
//
//        var firstIndex = -1
//
//        for (index, character) in s.enumerated() {
//            if uniqueCharacter.contains(character) {
//                firstIndex = index
//                break
//            }
//        }
//
//        return firstIndex
//    }
//}
//
//let solution = Solution()
//solution.firstUniqChar("leetcode")


//class Solution {
//    func plusOne(_ digits: [Int]) -> [Int] {
//        let stringArray = digits.map { "\($0)" }
//        let string = stringArray.joined(separator: "")
//        let number = Int(string)!
//        let finalNumber = number+1
//        let finalString = "\(finalNumber)"
//        let finalStringArray = Array(finalString)
//        let intArray = finalStringArray.map { Int("\($0)")! }
//        return intArray
//    }
//}
//
//let solution = Solution()
//solution.plusOne([0,0])


//class Solution {
//    func containsDuplicate(_ nums: [Int]) -> Bool {
//
//        let set = Set(nums)
//
//        return set.count != nums.count
//    }
//}
//
//let solution = Solution()
//solution.containsDuplicate([1,2,3,1])


//class Solution {
//    func firstUniqChar(_ s: String) -> Int {
//
//        var counts = [Character: Int]()
//
//        for character in s {
//            counts[character] = (counts[character] ?? 0) + 1
//        }
//
//        let nonRepeatingCharacters = s.filter { counts[$0] == 1 }
//
//        print("nonRepeatingCharacters: " + nonRepeatingCharacters)
//
//        return 0
//    }
//}

//let solution = Solution()
//solution.firstUniqChar("leetcode")


//class Solution {
//    func reverseString(_ s: inout [Character]) {
//        s = s.reversed()
//    }
//}
//
//let solution = Solution()
//var input: [Character] = ["h","e","l","l","o"]
//solution.reverseString(&input)
//print(input)

//class Solution {
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//
//        var indexes = [Int]()
//
//        for (i, number) in nums.enumerated() {
//            for (j, number2) in nums.enumerated() {
//                if number + number2 == target {
//                    if i != j {
//                        print(number, number2, i, j)
//                        if !indexes.contains(i) {
//                            indexes.append(i)
//                        }
//                        if !indexes.contains(j) {
//                            indexes.append(j)
//                        }
//                    }
//                }
//            }
//        }
//
//        return indexes
//    }
//}
//
//let solution = Solution()
//solution.twoSum([3,2,4], 6)


//class Solution {
//    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//        var intersection = [Int]()
//
//        var mutableNums2 = nums2
//
//        for number in nums1 {
//            if mutableNums2.contains(number) {
//                intersection.append(number)
//                let indexOfNumber = mutableNums2.firstIndex{ $0 == number }!
//                mutableNums2.remove(at: indexOfNumber)
//            }
//        }
//        return intersection
//    }
//}
//
//let solution = Solution()
//solution.intersect([1,2,2,1], [2,2])


//extension RangeReplaceableCollection {
//    func rotatingRight(positions: Int) -> SubSequence {
//        let index = self.index(endIndex, offsetBy: -positions, limitedBy: startIndex) ?? startIndex
//        return self[index...] + self[..<index]
//    }
//    mutating func rotateRight(positions: Int) {
//        let index = self.index(endIndex, offsetBy: -positions, limitedBy: startIndex) ?? startIndex
//        let slice = self[index...]
//        removeSubrange(index...)
//        insert(contentsOf: slice, at: startIndex)
//    }
//}

//var test2 = "1234567890"
//test2.rotateRight(positions: 3)

//class Solution {
//    func rotate(_ nums: inout [Int], _ k: Int) {
//        let index = nums.index(nums.startIndex, offsetBy: k, limitedBy: nums.endIndex) ?? 0
//        nums = Array(nums[(index+1)...] + nums[...index])
//    }
//}

//let solution = Solution()
//var array = [1,2,3,4,5,6,7,8]
////array.map { Int($0) ?? 0 }
//print(array)
//solution.rotate(&array, 3)
//print(array)

//class Solution {
//    func removeDuplicates(_ nums: inout [Int]) -> Int {
//        let set = Set(nums)
//        nums = Array(set).sorted()
//        return nums.count
//    }
//}
//
//let solution = Solution()
//var nums = [1,2,2,3,3,4]
//solution.removeDuplicates(&nums)
//print(nums)

//func getDelay(for n: Int) -> Int {
//    let maxDelay = 300000 // 5 minutes
//    let delay = Int(pow(2.0, Double(n))) * 1000
//    let jitter = Int.random(in: 0...1000)
//    return min(delay + jitter, maxDelay)
//}
//
//func execute(on queue: DispatchQueue, retry: Int = 0, closure: @escaping () -> Void) {
//    let delay = getDelay(for: retry)
//    queue.asyncAfter(
//        deadline: DispatchTime.now() + .milliseconds(delay),
//        execute: closure)
//}

//class Solution {
//    func singleNumber(_ nums: [Int]) -> Int {
//        var counterDictionary = [Int: Int]()
//
//        for element in nums {
//            if let count = counterDictionary[element] {
//                counterDictionary[element] = (count+1)
//            } else {
//                counterDictionary[element] = 1
//            }
//        }
//
//        print(counterDictionary)
//        let singleNumber = counterDictionary.filter { $0.value == 1 }.keys.first!
//        print(singleNumber)
//        return singleNumber
//    }
//}

//class Solution {
//    func singleNumber(_ nums: [Int]) -> Int {
//        var a = 0
//        for num in nums {
//            a ^= num
//        }
//        return a
//    }
//}

//class Solution {
//    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//
//        return nums2.filter { nums1.contains($0) }
        
        
//        var commonArray = [Int]()
//        var arrayToCompare = nums2
//        for element in nums1 {
//            if arrayToCompare.contains(element) {
//                commonArray.append(element)
//                arrayToCompare.removeAll { $0 == element }
//            }
//        }
        
//    }
//}

//let solution = Solution()
//solution.intersect([1,2,2,1], [2,2])


//class Solution {
//    func rotate(_ nums: inout [Int], _ k: Int) {
//
////        let firstHalf = nums[0..<k]
////        let secondHalf = nums[k...]
////
////        nums = Array(secondHalf + firstHalf)
//
////        for (index, element) in nums.enumerated() {
////
////        }
//
//        var counter = 0
//        var rotatedArray = nums
//
//        while counter <= k {
//            let elementToRotate = rotatedArray.removeFirst()
//            rotatedArray.append(elementToRotate)
//            counter += 1
//        }
//
//        nums = rotatedArray
//    }
//}
//
//let solution = Solution()
//var nums = [-1,-100,3,99]//[1,2,3,4,5,6,7]
//solution.rotate(&nums, 2)
//print(nums)


//func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
//    if range.lowerBound >= range.upperBound {
//        // If we get here, then the search key is not present in the array.
//        return nil
//
//    } else {
//        // Calculate where to split the array.
//        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
//
//        // Is the search key in the left half?
//        if a[midIndex] > key {
//            return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
//
//        // Is the search key in the right half?
//        } else if a[midIndex] < key {
//            return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
//
//        // If we get here, then we've found the search key!
//        } else {
//            return midIndex
//        }
//    }
//}
//
//let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
//
//binarySearch(numbers, key: 43, range: 0 ..< numbers.count)

//class Solution {
//    func checkRecord(_ s: String) -> Bool {
//
//        var absentCounter = 0
//        var wasLateYesterday = ""
//
//        for character in s {
//            if character == "A" {
//                absentCounter += 1
//                if absentCounter > 1 {
//                    return false
//                }
//            } else if character == "L" {
//                wasLateYesterday += "L"
//                if wasLateYesterday.count > 2 {
//                    return false
//                }
//            } else {
//                wasLateYesterday = ""
//            }
//        }
//        return true
//    }
//}
//
//let solution = Solution()
//solution.checkRecord("PPALLPL")


//class Solution {
//    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
//
//        let index: Int
//
//        if nums.contains(target) {
//            index = nums.firstIndex(of: target)!
//        } else {
//            var newUnsortedArray = nums
//            newUnsortedArray.append(target)
//            let newSortedArray = newUnsortedArray.sorted()
//
//            index = newSortedArray.firstIndex(of: target)!
//        }
//        return index
//    }
//}
//
//let solution = Solution()
//solution.searchInsert([1,3,5,6], 2)


//var mortgageRemaining = 100_000


//protocol Event: class {
//    var title: String { get }
//    var startDate: String { get }
//    var endDate: String { get }
//}

//enum DishCategory: Int {
//    case firstCourses, mainCourses, garnishes, drinks
//}
//
//struct Dish {
//    var name: String
//    var price: Float
//}
//
//struct OrderItem {
//    var dish: Dish
//    var count: Int
//}
//
//struct Order {
//    var firstCourses = [OrderItem]()
//    var mainCourses = [OrderItem]()
//    var garnishes = [OrderItem]()
//    var drinks = [OrderItem]()
//
//    var price: Float {
//        let items = firstCourses + mainCourses + garnishes + drinks
//        return items.reduce(Float(0), { $0 + $1.dish.price * Float($1.count) })
//    }
//}
//
//// Builder
//class OrderBuilder {
//    private var order: Order?
//
//    func reset() {
//        order = Order()
//    }
//
//    func setFirstCourse(_ dish: Dish) {
//        set(dish, at: order?.firstCourses, withCategory: .firstCourses)
//    }
//
//    func setMainCourse(_ dish: Dish) {
//        set(dish, at: order?.mainCourses, withCategory: .mainCourses)
//    }
//
//    func setGarnish(_ dish: Dish) {
//        set(dish, at: order?.garnishes, withCategory: .garnishes)
//    }
//
//    func setDrink(_ dish: Dish) {
//        set(dish, at: order?.drinks, withCategory: .drinks)
//    }
//
//    func getResult() -> Order? {
//        return order ?? nil
//    }
//
//    private func set(_ dish: Dish, at orderCategory: [OrderItem]?, withCategory dishCategory: DishCategory) {
//        guard let orderCategory = orderCategory else {
//            return
//        }
//
//        var item: OrderItem! = orderCategory.filter( { $0.dish.name == dish.name } ).first
//
//        guard item == nil else {
//            item.count += 1
//            return
//        }
//
//        item = OrderItem(dish: dish, count: 1)
//
//        switch dishCategory {
//        case .firstCourses:
//            order?.firstCourses.append(item)
//        case .mainCourses:
//            order?.mainCourses.append(item)
//        case .garnishes:
//            order?.garnishes.append(item)
//        case .drinks:
//            order?.drinks.append(item)
//        }
//    }
//}
//
//// Usage
//let steak = Dish(name: "Steak", price: 2.30)
//let chips = Dish(name: "Chips", price: 1.20)
//let coffee = Dish(name: "Coffee", price: 0.80)
//
//let builder = OrderBuilder()
//builder.reset()
//builder.setMainCourse(steak)
//builder.setGarnish(chips)
//builder.setDrink(coffee)
//
//let order = builder.getResult()
//order?.price


//precedencegroup ForwardApplication {
//    associativity: left
//}
//
//infix operator |>: ForwardApplication
//
//func |> <A, B>(a: A, f: (A) -> B) -> B {
//    f(a)
//}
//
//func incr(_ x: Int) -> Int {
//    x + 1
//}
//
//extension Int {
//    func incr() -> Int {
//        self + 1
//    }
//
//    func square() -> Int {
//        self * self
//    }
//}
//
//2.incr().incr().square()
//
//2 |> incr |> incr

//let classes = [
//    ["Ash", "Brock", "Misty"],
//    ["Gloria", "Piper", "Suzanne"],
//    ["Picard", "Riker", "Troi"]
//]
//
//let allStudents = Array(classes.joined())
//print(allStudents)

//let jsonString = """
//[
//    {
//        "name": "Taylor Swift",
//        "age": 26
//    },
//    {
//        "name": "Justin Bieber",
//        "age": 25
//    }
//]
//"""
//
//let jsonData = Data(jsonString.utf8)
//
//struct Person: Codable {
//    var name: String
//    var age: Int
//}
//
//let decoder = JSONDecoder()
//
//do {
//    let people = try decoder.decode([Person].self, from: jsonData)
//    print(people)
//} catch {
//    print(error.localizedDescription)
//}

//let formatter3 = DateFormatter()
//formatter3.dateFormat = "EEEE"
//print(formatter3.string(from: Date()))

//let exampleDate = Date().addingTimeInterval(-14400)
//
//// ask for the full relative date
//let formatter = RelativeDateTimeFormatter()
//formatter.unitsStyle = .full
//
//// get exampleDate relative to the current date
//let relativeDate = formatter.localizedString(for: exampleDate, relativeTo: Date())
//
//// print it out
//print("Relative date is: \(relativeDate)")


//let color1 = UIColor(white: 1 / 255, alpha: 1.0)
//let color2 = UIColor(white: 2.0 / 255.0, alpha: 1.0)
//
//let result = (color1 == color2)

//var language = "Objc"
//
//let code = { [language] in
//    print(language)
//}
//
//language = "Swift"
//
//let newCode = code
//newCode()

//class Parent {
//    func printer() {
//        print("Parent")
//    }
//}
//
//class Child: Parent {
//    override func printer() {
//        super.printer()
//        print("Child")
//    }
//}
//
//let child = Child()
//child.printer()

//struct Person {
//    var age = 16
//
//    lazy var fibonacciOfAge: Int = {
//        return fibonacci(of: self.age)
//    }()
//
//    func fibonacci(of num: Int) -> Int {
//        if num < 2 {
//            return num
//        } else {
//            return fibonacci(of: num - 1) + fibonacci(of: num - 2)
//        }
//    }
//}
//
//var p = Person(age: 5)
//p.fibonacciOfAge


//var result = 0
//
//func update(_ completion: @autoclosure () -> (Int)) {
//    result = completion()
//}
//
//update(10)

//indirect enum LinkedListItem<T> {
//    case endPoint(value: T)
//    case linkNode(value: T, next: LinkedListItem)
//}
//
//let third = LinkedListItem.endPoint(value: "Third")
//let second = LinkedListItem.linkNode(value: "Second", next: third)
//let first = LinkedListItem.linkNode(value: "First", next: second)
//
//var currentNode = first
//
//listLoop: while true {
//    switch currentNode {
//    case .endPoint(let value):
//        print(value)
//        break listLoop
//    case .linkNode(let value, let next):
//        print(value)
//        currentNode = next
//    }
//}

//struct A {
//    var plus: APlus?
//}
//
//struct APlus {
//    var a: A?
//    var x = 2
//}
//
//var a: A = A()
//var plus = APlus()
//plus.x = 5

//var messages = [200: "OK",
//                404: "Not Found"]
//
//var foo: (Int) -> String = { code in
//    if code > 500 {
//        return "Server"
//    }
//    return "Unknown"
//}
//
//let message = messages[300, default: foo(300)]

//struct Directions: OptionSet {
//    let rawValue: UInt8
//
//    static let up    = Directions(rawValue: 1 << 0)
//    static let down  = Directions(rawValue: 1 << 1)
//    static let left  = Directions(rawValue: 1 << 2)
//    static let right = Directions(rawValue: 1 << 3)
//}
//Directions.right.rawValue
//
//let allowedMoves: Directions = [.up, .down, .left]
//print(allowedMoves.rawValue)

//struct GridPoint {
//    var x: Int
//    var y: Int
//}
//
//extension GridPoint: Hashable {
//    static func == (lhs: GridPoint, rhs: GridPoint) -> Bool {
//        return lhs.x == rhs.x && lhs.y == rhs.y
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(x)
//        hasher.combine(y)
//    }
//}

//enum LangCode: String, Hashable {
//    case en, de
//}
//
//struct Language<T: RawRepresentable, Hashable> where T.RawValue == String {
//    var lang: [T: String] = [.de: "D"]
//}
//
//let a = Language<LangCode, String>(lang: [.en: "E"])

//enum Skill: Int {
//    case swiftUI, combine, arkit = 3
//    static subscript(n: Int) -> Skill? {
//        return Skill(rawValue: n)
//    }
//}
//let skill = Skill[3]

//func test(x: () -> ()) {
//func x() {
//    print("Function")
//}
//x()
//}
//
//test {
//    print("Block")
//}

//var count = 0
//
//class A {
//    var b: (() -> Void)?
//
//    func update(completion: @escaping () -> Void) {
//        b = completion
//        completion()
//        b?()
//        count += 1
//    }
//}
//
//A().update { count += 1 }
//print(count)

//var count = 0
//var book: String = {
//    count += 1
//    return "Advanced Swift"
//}()
//
//func add(_ completion: @autoclosure () -> String) {
//    count += 1
//}
//
//add(book)
//count

//struct A {
//    static var x = "Advanced"
//    var xBuzz: String {
//        willSet {
//            print("newValue: " + newValue)
//            A.x = newValue
//        }
//        didSet {
//            print("oldValue: " + oldValue)
//            A.x = oldValue
//        }
//    }
//}
//
//let obj = A(xBuzz: "Swift")
//print(A.x)

//let numbers = ["1", "two", nil]
//
//let mapped: [Int?] = numbers.compactMap { Int($0 ?? "0") }
//
//mapped.count
//
//print(mapped)

//protocol A {
//    var desc: String { get }
//}
//
//extension A {
//    var desc: String { "A" }
//}
//
//struct S: A {
//    var street: String
//    var desc: String { street }
//}
//
//let a = S(street: "S")
//a[keyPath: \A.desc]

//var x = 42
//
//let result: Result<Int, Error> = .success(x)
//x = 21
//
//switch result {
//case .success(x):
//    print(x)
//case .failure(_):
//    print("Error")
//default:
//    print("Default")
//}

//var dictWithNils: [String: Int?] = [
//    "one": 1,
//    "two": 2,
//    "none": Optional.some(3)
//]
//dictWithNils.count
//dictWithNils["two"] = nil
//dictWithNils["none"] = nil
//let result = dictWithNils.count

//var counter = 5
//
//func increment() -> Int {
//    defer { counter += 1 }
//    return counter
//}
//
//counter = increment()
//counter

//let p = Publishers.Sequence<[Int], Error>(sequence: [1, 4, 8])
//p  .append([3, 8, 10])
//    .filter { $0 >= 3 }
//    .count()
//
//let allEven = p.tryAllSatisfy { $0 % 2 == 0 }
//
//allEven.result

//final class R { }
//struct X {
//    var ref = R()
//    mutating func change() -> String {
//        return isKnownUniquelyReferenced(&ref) ? "No copy" : "Copy"
//    }
//}
//let x = X()
//var array = [x]
//array[0].change()

//var quiz = ("iOS", "Quiz") {
//    didSet {
//        quiz.1 = "Swift"
//    }
//}
//quiz.0 = "Advanced"
//quiz

//var screen = CGRect(x: 0, y: 0, width: 320, height: 480) {
//    didSet { print("Screen changed") }
//}
//
//screen.origin.x = 30
//var screen2 = screen
//screen2.size = CGSize(width: 20, height: 20)
//screen2.origin.x = 10

//struct IntegralSize {
//    var width: Int
//    var height: Int
//
//    init(_ size: CGSize) {
//        self.width = Int(size.width)
//        self.height = Int(size.height)
//    }
//}
//
////let size = IntegralSize(width: 50, height: 50)
//let size = IntegralSize(CGSize(width: 30, height: 30))



//var comps = DateComponents()
//comps.day = 2
//comps.month = 2
//comps.year = 2021
//comps.hour = 17
//comps.minute = 30
//
//let cal = Calendar.current
//let date = cal.date(from: comps)
//let comp1 = cal.dateComponents([.weekdayOrdinal], from: Date())
//let comp2 = cal.component(.day, from: Date())




//@dynamicCallable
//struct TelephoneExchange {
//    func dynamicallyCall(withArguments phoneNumber: [Int]) {
//        if phoneNumber == [4, 1, 1] {
//            print("Get Swift help on forums.swift.org")
//        } else {
//            print("Unrecognized number")
//        }
//    }
//}
//
//let dial = TelephoneExchange()
//
//dial(4,1,1)
//dial(1,2)

//class R: NSObject {
//    let int: Int
//    init(_ int: Int) { self.int = int }
//}
//
//func ==(l: R, r: R) -> Bool { return l.int == r.int }
//
//let i1: NSObject = R(2)
//let i2: NSObject = R(2)
//i1 == i2

//struct USD: Equatable {
//    var cents: Int
//    static func ==(l: USD, r: USD) -> Bool {
//        return l.cents == r.cents
//    }
//}
//
//let x: Equatable = USD(cents: 100)

//protocol Drawing {
//    func render()
//}
//
//extension Drawing {
//    func circle() { print("protocol") }
//    func render() { circle() }
//}
//
//class SVG: Drawing {
//    func circle() { print("class") }
//}
//
//SVG().render()

//let s2: String?? = .some(nil)
//(s2 ?? "inner") ?? "outer"
//
//let a: String? = .some("a")
//a


//print("Hello World")
//
//var b: Int? = nil
//b? = 10
//
//b


//struct MemoryGame<CardContent> {
//    var cards: [Card]
//
//    struct Card {
//        var isFaceUp: Bool
//        var isMatched: Bool
//
//        var content: CardContent
//
//    }
//
//}

//protocol Greatness {
//    func isGreaterThan() -> Bool
//}
//
//extension Array where Element: Greatness {
//    var greatest: Element {
//
//        var greatestElement: Element
//
//        for element in self {
////            if element > greatestElement {
//            if element.isGreaterThan() {
//                <#code#>
//            }
//                greatestElement = element
//            }
//        }
//        return greatestElement
//    }
//
//}

//protocol Vehicle {
//    var id: String { get set }
//
//    func move()
//}
//
//extension Vehicle {
//
//    func move() {
//        print("Moving")
//    }
//}

//let vehi = Vehicle()


//
//var foo: () -> Double
//
//func someFoo() -> Double {
//    print("hello")
//    return 1.0
//}
//
//foo = someFoo
//
//foo()

//func doSomething(what: () -> Bool) {
//    print("hello")
//    print(what())
//}
//
//doSomething { () -> Bool in
//    print("world")
//    return true
//}

//extension RandomAccessCollection where Element: Comparable, Index == Int {
//    func binarySearch(for item: Element) -> Index? {
//        guard self.count > 1 else {
//            if let first = self.first, first == item {
//                return self.startIndex
//            }  else {
//                return nil
//            }
//        }
//
//        let middleIndex = (startIndex + endIndex) / 2
//        let middleItem = self[middleIndex]
//
//        if middleItem < item {
//            return self[index(after: middleIndex)...].binarySearch(for: item)
//        } else if middleItem > item {
//            return self[..<middleIndex].binarySearch(for: item)
//        } else {
//            return middleIndex
//        }
//    }
//}
//
//let words = ["Hello", "world", "how", "are", "you"].sorted()
//print(words.binarySearch(for: "world") as Any) // Optional(3)



//let integers = (0..<5)
//let squareCoords = integers.flatMap { i in
//    return integers.map { j in
//        return (i, j)
//    }
//}

//print(integers)
//
//print(squareCoords)

//let map = (0..<10).fmap {i in
//    return i%2 == 0 ? "\(i) is even" : "\(i) is odd"
//}
//
//print(map)

//let array = ["Hello", "world", "how", "are", "you"]
//var numberOfWordsChecked = 0
//let threeLetterWord = array.first(where: { word in
//    numberOfWordsChecked += 1
//    return word.count == 3
//})
//
//print(threeLetterWord) // how
//print(numberOfWordsChecked) // 3
