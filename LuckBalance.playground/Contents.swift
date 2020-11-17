import Foundation
// L[i] = The amount of luck associated with a contest
    // Winning reduces luck by this number
    // Losing adds luck by this number

// T[i] = The contests importance rating.
    // 1 = important
    // 0 = not important

// If Lena loses no more than k important contents, what is the maximum amount of luck she has?


// luck starts at 0

// n = the number of contests
// k = the number of important contests she can lose


// work out the maximum amount of luck she can have, so pick the k largest values of L, where T = important

func luckBalance(k: Int, contests: [[Int]]) -> Int {
    var importantValues = [Int]()
    var luck = 0
    
    for i in 0 ..< contests.count {
        if contests[i][1] == 1 {
            importantValues.append(contests[i][0])
            luck -= contests[i][0]
        } else {
            luck += contests[i][0]
        }
    }
    
    let importantValuesSorted = importantValues.sorted(by: >).prefix(k)
    
    for i in 0 ..< importantValuesSorted.count {
        guard i < k else {
            return luck
        }
        
        luck += (importantValuesSorted[i] * 2)
    }
    
    return luck
}

func luckBalanceTwo(k: Int, contests: [[Int]]) -> Int {
    let sortedContests = contests.sorted { (x, y) -> Bool in
        return x[0] > y[0]
    }
    
    var numLossesRemaning = k
    var luck = 0
    
    for contest in sortedContests {
        if contest[1] == 0 {
            luck += contest[0]
        } else if numLossesRemaning > 0 {
            luck += contest[0]
            numLossesRemaning -= 1
        } else {
            luck -= contest[0]
        }
    }
    
    return luck
}




let contestsOne: [[Int]] = [
    [5, 1],
    [2, 1],
    [1, 1],
    [8, 1],
    [10, 0],
    [5, 0]
]
let startOne = Date().timeIntervalSince1970
for _ in 0 ..< 1000 {
    let _ = luckBalance(k: 3, contests: contestsOne)
}
print("One: \(Date().timeIntervalSince1970 - startOne)")


let startTwo = Date().timeIntervalSince1970
for _ in 0 ..< 1000 {
    let _ = luckBalanceTwo(k: 3, contests: contestsOne)
}
print("Two: \(Date().timeIntervalSince1970 - startTwo)")
