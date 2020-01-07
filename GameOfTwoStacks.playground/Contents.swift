import Foundation

func calculateSums(x: Int, array: [Int]) -> [Int] {
    var sum = 0
    return ([0] + array).compactMap({ val in
        sum += val
        return sum <= x ? sum : nil
    })
}

// Iterate incrementally
func twoStacks(x: Int, a: [Int], b: [Int]) -> Int {
    let aSums = calculateSums(x: x, array: a)
    let bSums = calculateSums(x: x, array: b)
    
    // does max work?
    if (aSums.count - 1) == a.count, (bSums.count - 1) == b.count {
        if (aSums[aSums.count - 1] + bSums[bSums.count - 1]) <= x {
            return aSums.count + bSums.count - 2
        }
    }
    
    var maxTurns = 0
    for aIndex in 0..<aSums.count {
        for bIndex in 0..<bSums.count {
            let total = aSums[aIndex] + bSums[bIndex]
            
            if total <= x {
                // continue with this until the end
                let numTurns = aIndex + bIndex
                if numTurns > maxTurns {
                    maxTurns = numTurns
                }
            } else {
                break
            }
        }
    }
        
    return maxTurns
}

// Iterate decrementally
func twoStacksBackwards(x: Int, a: [Int], b: [Int]) -> Int {
    let aSums = calculateSums(x: x, array: a)
    let bSums = calculateSums(x: x, array: b)
    
    // does max work?
    if (aSums.count - 1) == a.count, (bSums.count - 1) == b.count {
        if (aSums[aSums.count - 1] + bSums[bSums.count - 1]) <= x {
            return aSums.count + bSums.count - 2
        }
    }
    
    var maxTurns = 0
    for aCounter in 1...aSums.count {
        for bCounter in 1...bSums.count {
            let aIndex = aSums.count - aCounter
            let bIndex = bSums.count - bCounter
            let total = aSums[aIndex] + bSums[bIndex]
            if total <= x {
                let numTurns = aIndex + bIndex
                if numTurns > maxTurns {
                    maxTurns = numTurns
                }
                break
            }
        }
    }
    
    return maxTurns
}

let a = [4, 2, 4, 6, 1]
let b = [2, 1, 8, 5]

print(twoStacks(x: 10, a: a, b: b))
print(twoStacksBackwards(x: 10, a: a, b: b))

let i = [7, 15, 12, 0, 5, 18, 17, 2, 10, 15, 4, 2, 9, 15, 13, 12, 16]
let j = [12, 16, 6, 8, 16, 15, 18, 3, 11, 0, 17, 7, 6, 11, 14, 13, 15, 6, 18, 6, 16, 12, 16, 11, 16, 11]

print(twoStacks(x: 62, a: i, b: j))
print(twoStacksBackwards(x: 62, a: i, b: j))

let x = [15, 12, 14, 4, 5, 6, 10, 13, 7, 8, 18, 11, 6, 10, 1, 11, 16, 0, 1, 5, 16, 16, 6, 9, 9, 15, 16, 12, 12, 9, 6, 7, 2, 0, 11, 7, 18, 13, 12, 5, 14, 10, 9, 0, 12, 10]
let y = [11, 9, 11, 5, 14, 19, 13, 12, 8, 2, 19, 17, 6, 11, 6, 12, 10, 8, 5, 13, 8, 3, 7, 0, 1, 13, 3, 10, 13, 15, 0, 16, 16, 3, 13, 3, 3, 6, 15, 3, 8, 7]

print(twoStacks(x: 75, a: x, b: y))
print(twoStacksBackwards(x: 75, a: x, b: y))
