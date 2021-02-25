import UIKit

//let date = Date(timeIntervalSinceNow: 20000000) // now
//let cal = Calendar.current
//let day = cal.ordinality(of: .day, in: .year, for: date)
//print(day)


// Steps:
// 1. Get the date of the first Monday of the Vacation Begin month called Start Date
// 2. Get the date of the first Sunday of the Vacation End month called End Date
// 3. Get the "DayOfTheYear" for Start Date. Example: Feb 1 would be DayOfTheYear 32
// 4. Get the "DayOfTheYear" for End Date. Example: Dec 31 would be DayOfTheYear 365
// 5. Find the difference between End - Start DayOfTheYear. Example: Dec 31 - Feb 1 == 365 - 32 = 333 days of Vacation
// 6. Divide 333 days by 7 to get number of weeks i.e. 333/7=47
// 7. The answer is 47 weeks of vacation when StartMonth:Feb, EndMonth: December

//public func solution(_ Y : Int, _ A : inout String, _ B : inout String, _ W : inout String) -> Int {
//    // write your code in Swift 4.2.1 (Linux)
//}

func getDayOfTheYear(date: Date) -> Int? {
    let cal = Calendar.current
    let day = cal.ordinality(of: .day, in: .year, for: date)
    return day
}

getDayOfTheYear(date: Date())

func getStartDate(month: String, year: String) -> Date {
    // get first Monday
    if Date {
        
    }
}

func getEndDate(month: String, year: String) -> Date {
    // get first Sunday
}

let firstDate = getDayOfTheYear(date: getStartDate(month: "April", year: "2014"))
let lastDate = getDayOfTheYear(date: getEndDate(month: "May", year: "2014"))


//let num = 13
//let str1 = String(num, radix: 2)
//print(str1) // prints "10110"
//
//let str = "011100"
//
//let intStr = Int(str)

//public func solution(_ S : inout String) -> Int {
//
//    var intValue = getIntFromBinary(string: S)
//    print(intValue)
//
//    var stepsCounter = 0
//
//
//    while intValue != 0 {
//
//        if intValue % 2 == 0 {
//            intValue = intValue / 2
//        } else {
//            intValue -= 1
//        }
//
//        stepsCounter += 1
//    }
//
//    print("Steps: \(stepsCounter)")
//
//    return stepsCounter
//}
//
//
//func getIntFromBinary(string: String) -> Int {
//
//    var integerValue = 0
//    var counter = 0
//
//    let reversedString = string.reversed()
//
//    for character in reversedString {
//        let characterIntValue = Int("\(character)")!
//        let powerValue = Int(truncating: NSDecimalNumber(decimal: pow(2, counter)))
//        integerValue += characterIntValue * powerValue
//        counter += 1
//    }
//
//    return integerValue
//}
//
//var str = "111"
//solution(&str)
