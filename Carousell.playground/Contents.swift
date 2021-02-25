import Foundation

//func numberOfA(s: String, n: Int) -> Int {
//    let array = Array(repeating: s, count: n)
//
//    var count = 0
//
//    for char in array {
//        if char.contains("a") {
//            count += 1
//        }
//    }
//
//    return count
//}
//
//numberOfA(s: "abc", n: 9)



//var str = "Hello, playground"

//func arrangedPalindrome(_ s: String) -> String {
//
//    if isPalindrome(s) {
//        return s
//    }
//
//    var map = [String: Int]()
//
//    for character in s {
//
//        if var existingCount = map["\(character)"] {
//            existingCount += 1
//            map["\(character)"] = existingCount
//        } else {
//            map["\(character)"] = 1
//        }
//    }
//
//    print(map)
//
//    let oddCharacterCounts = Array(map.values.filter { $0 % 2 != 0 })
//
//    if oddCharacterCounts.count > 1 {
//        print("CANNOT be Arranged In Palindrome")
//    }
//    else if oddCharacterCounts.count == 1 && s.count % 2 == 0 {
//        print("CANNOT be Arranged In Palindrome")
//    }
//    else {
//        print("YES! Palindrome can be formed")
//    }
//
//    var firstHalf = "", secondHalf = ""
//
//    for (character, count) in map {
//
//        let halfCount = count / 2
//        print(character, count, halfCount)
//
//        for i in 0..<halfCount {
//            firstHalf += "\(character)"
//            let sHalf = "\(character)" + secondHalf
//            secondHalf = sHalf
//        }
//    }
//
//    print(firstHalf, secondHalf)
//    return firstHalf + secondHalf
//}
//
//func isPalindrome(_ s: String) -> Bool {
//    return s == String(s.reversed())
//}

//arrangedPalindrome("yyooxx")
