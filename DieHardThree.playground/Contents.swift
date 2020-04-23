import Foundation

func gcd(a: Int, b: Int) -> Int {
    let r = a % b
    if r != 0 {
        return gcd(a: b, b: r)
    } else {
        return b
    }
}

func solve(a: Int, b: Int, c: Int) -> String {
    guard c <= a || c <= b else {
        return "NO"
    }

    if c % gcd(a: a, b: b) == 0 {
        return "YES"
    }

    return "NO"
}

print(solve(a: 5, b: 3, c: 4))
print(solve(a: 3, b: 6, c: 4))
