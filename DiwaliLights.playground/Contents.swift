import Foundation
import Darwin

// 2 x 2 x 2 = 2, 4, 8
// 2 x 2 x 2 x 2 = 2, 4, 8, 16
func lights(n: Int) -> Int {
    guard n > 0 else {
        return 1
    }
    var start = UInt64(exactly: 2)!
    let base = UInt64(exactly: 2)!
    let power = UInt64(exactly: n)!

    for _ in 1..<power {
        start = (start * base) % 100000
    }

    start -= 1
    return Int(start)
}

//(2 ^ n) - 1
lights(n: 1)
lights(n: 2)
lights(n: 3)
lights(n: 4)
lights(n: 5)
lights(n: 1000)

lights(n: 7555)
