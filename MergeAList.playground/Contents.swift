import Foundation

let mod: Double = 1_000_000_007

func solve(n: Int, m: Int) -> Int {
    let result = ( factorial(m + n) / (factorial(m) * factorial(n)) )
    return mod(result)
}

func factorial(_ n: Int) -> Double {
    if n == 0 {
        return 1
    }
    var a: Double = 1
    for i in 1...n {
        a *= Double(i)
    }
    return a
}

func mod(_ double: Double) -> Int {
    1000000007
}

//solve(n: 2, m: 2)
//
//solve(n: 59, m: 67) // 885 566 595

solve(n: 40, m: 70) // 202 851 988

// 59 67 -> 885 566 595
