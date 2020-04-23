import Foundation

func triplets(a: [Int], b: [Int], c: [Int]) -> Int {

    let uniqueA = Array(Set(a)).sorted()
    let uniqueB = Array(Set(b)).sorted()
    let uniqueC = Array(Set(c)).sorted()

    let countA = uniqueA.count
    let countC = uniqueC.count

    var total = 0
    var a = 0
    var c = 0

    // Only B matters in comparison, so anything that works for a -> b will work with b->c
    for b in uniqueB {
        while a < countA && uniqueA[a] <= b {
            a += 1
        }

        while c < countC && uniqueC[c] <= b {
            c += 1
        }

        // number of a times number of c is the number of combinations to add, as all a can match with all c
        total += (a * c)
    }

    return total
}

let result = triplets(a: [1, 3, 5], b: [2, 3], c: [1, 2, 3]) // 8

print(result)
