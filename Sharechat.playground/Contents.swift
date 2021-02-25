import UIKit
/*
func getDegree(_ array: [Int]) -> Int {
    
    var map = [Int: Int]()
    
    for number in array {
        
        if var existingElement = map[number] {
            existingElement += 1
            map[number] = existingElement
        } else {
            map[number] = 1
        }
    }
    
//    print(map)
    
    var highestDegree = 0
    var highestDegreeNumber = 0
    
    for (key, value) in map {
        if value > highestDegree {
            highestDegree = value
            highestDegreeNumber = key
        }
    }
    
//    print(highestDegreeNumber, highestDegree)
    
    var startIndex = 0
    var endIndex = array.count - 1
    
    var targetHits = 0
    
    for (index, number) in array.enumerated() {
        if number == highestDegreeNumber {
            targetHits += 1
            if targetHits == 1 {
                startIndex = index
            }
            if targetHits == highestDegree {
                endIndex == index
                break
            }
        }
    }
    
//    print(startIndex, endIndex)
    
    let filteredArray = Array(array[startIndex..<endIndex])
    
    print(filteredArray)
    
    return filteredArray.count
}



func getDegree(_ array: [Int]) -> Int {
    
    var map = [Int: Int]()
    
    for number in array {
        
        if var existingElement = map[number] {
            existingElement += 1
            map[number] = existingElement
        } else {
            map[number] = 1
        }
    }
    
//    print(map)
    
    let valuesArray = Array(map.values)
    
//    print(valuesArray)
    
    let highestDegree = valuesArray.max()
    
    let filteredMap = map.filter { $1 == highestDegree }
    
//    print(filteredMap)
    
    var slicedArrays = [[Int]]()
    
    for (key, value) in filteredMap {
        
        var startIndex = 0
        var endIndex = array.count - 1
        
        var targetHits = 0
        
        for (index, number) in array.enumerated() {
            if number == key {
                targetHits += 1
                if targetHits == 1 {
                    startIndex = index
                }
                if targetHits == value {
                    endIndex = index
                    let slicedArray = Array(array[startIndex...endIndex])
                    slicedArrays.append(slicedArray)
                    break
                }
            }
        }
    }
    
//    print(slicedArrays)
    
    var minCount = Int.max
    
    for slice in slicedArrays {
        let count = slice.count
        print(slice)
        if count < minCount {
            minCount = count
        }
    }

    return minCount
}

*/


func getDegree(_ array: [Int]) -> Int {
    
    var differences = [Int]()
    
    for (index, number) in array.enumerated() {
        
        var anotherIndex = index + 1
        
        var startIndex = 0
        var endIndex = 0
        
        var hits = 0
        
        
        while anotherIndex < array.count {
            
            let anotherNumber = array[anotherIndex]
            
            if anotherNumber == number {
                hits += 1
                
                if hits == 1 {
                    startIndex = index
                }
                
                endIndex = anotherIndex
            }
            
            anotherIndex += 1
        }
        
        let difference = endIndex - startIndex
//        print(number, difference, startIndex, endIndex)
        differences.append(difference)
    }
    
    return (differences.max()! + 1)
}

print(getDegree([1, 3, 3, 2, 2, 3, 4, 3, 2, 2]))

//print(getDegree([1,2,3,4,5,6,7,8,8,7,6,5,4,3,2,1]))

// O(n) * constant

//O(n(n-1))
