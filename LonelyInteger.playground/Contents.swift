extension Int {
    var pattern: String {
        var binary = String(self, radix: 2)
        for _ in 0..<(8 - binary.count) {
          binary = "0" + binary
        }
        return binary
    }
}

func lonelyInteger(a: [Int]) -> Int {
    return a.reduce(0, { $0 ^ $1 })
}

/*
 00000000 XOR 00000000 = 00000000
 00000000 XOR 00000000 = 00000000
 00000000 XOR 00000001 = 00000001
 00000001 XOR 00000010 = 00000011
 00000011 XOR 00000001 = 00000010
 */
let input: [Int] = [3, 0, 0, 1, 2, 1, 3, 5, 5]
let result = lonelyInteger(a: input)
