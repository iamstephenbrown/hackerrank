// https://www.hackerrank.com/challenges/ctci-merge-sort/problem

protocol Sorter: class {
    func sort(arr: [Int]) -> [Int]
}

class MergeSorter: Sorter    {
    var numInversions = 0
    func sort(arr: [Int]) -> [Int] {
        guard arr.count > 1 else {
            return arr
        }
        
        let middleIndex = arr.count / 2
        
        let leftArray = sort(arr: Array(arr[0 ..< middleIndex]))
        let rightArray = sort(arr: Array(arr[middleIndex ..< arr.count]))
        return merge(leftArray: leftArray, withRightArray: rightArray)
    }
    
    private func merge(leftArray: [Int], withRightArray rightArray: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        let leftCount = leftArray.count
        let rightCount = rightArray.count
        var orderedArray = [Int]()
        
        while leftIndex < leftCount, rightIndex < rightCount {
            let left = leftArray[leftIndex]
            let right = rightArray[rightIndex]
            if left <= right {
                orderedArray.append(left)
                leftIndex += 1
            } else {
                numInversions += (leftCount - leftIndex)
                orderedArray.append(right)
                rightIndex += 1
            }
        }
        
        if leftIndex < leftCount {
            orderedArray += leftArray[leftIndex ..< leftCount]
        } else {
            orderedArray += rightArray[rightIndex ..< rightCount]
        }
        
        return orderedArray
    }
}
 func countInversions(arr: [Int]) -> Int {
    let sorter = MergeSorter()
    sorter.sort(arr: arr)
    return sorter.numInversions
}


print(countInversions(arr: [1, 1, 1, 2, 2])) // 0
print(countInversions(arr: [2, 1, 3, 1, 2])) // 4
