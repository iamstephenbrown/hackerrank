import Foundation

private func minCounter(n: Int) -> Int {
    let value = 1
    return value
}

// 5 = 90
// 7 = 9009
// 1 = 9
// 9 = 9
// 192 = 900000000
func solve(n: Int) -> String {
    
    var counter = 1
    var value = nextValue(counter)
    
    while value % n != 0 {
        counter += 1
        value = nextValue(counter)
    }
    
    return "\(value)"
}

func nextValue(_ num: Int) -> Int {
    let binaryVersion = String(num, radix: 2)
    let nineVersion = binaryVersion.replacingOccurrences(of: "1", with: "9")
    return Int(nineVersion)!
}

let rand = Int.random(in: 400...500)
solve(n: rand)

//solve(n: 5) == "90"
//solve(n: 7) == "9009" // 9009
//solve(n: 1) == "9" // 9
//
//solve(n: 1) == "9"
//solve(n: 2) == "90"
//solve(n: 3) == "9"
//solve(n: 4) == "900"
//solve(n: 5) == "90"
//solve(n: 6) == "90"
//solve(n: 7) == "9009"
//solve(n: 8) == "9000"
//solve(n: 9) == "9"
//solve(n: 10) == "90"
//solve(n: 11) == "99"
//solve(n: 12) == "900"
//solve(n: 13) == "9009"
//solve(n: 14) == "90090"
//solve(n: 15) == "90"
//solve(n: 16) == "90000"
//
//solve(n: 100) == "900"
//solve(n: 101) == "909"
//solve(n: 102) == "999090"
//solve(n: 103) == "99900009"
//solve(n: 104) == "9009000"
//solve(n: 105) == "90090"
//solve(n: 106) == "9000990"
//solve(n: 107) == "900090099"
//solve(n: 108) == "99900"
//solve(n: 109) == "9009090999"
//solve(n: 110) == "990"
//solve(n: 111) == "999"
//solve(n: 112) == "90090000"
//solve(n: 113) == "9099099"
//solve(n: 114) == "990090"
//solve(n: 115) == "9909090"
//
//solve(n: 205) == "999990"
//
//solve(n: 321) == "900090099"
//solve(n: 457) == "9009909009"
