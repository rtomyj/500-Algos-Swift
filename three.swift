func findZeroSum(_ items: [Int]) -> [[Int]]
{
	var sums = [Int]()
	var zeroSums = [[Int]]()

	for (ind, item) in items.enumerated()
	{
		sums.append(item)
		for jnd in (0..<sums.count - 1)
		{
			sums[jnd] += item
			if (sums[jnd] == 0)
			{
				zeroSums.append(Array(items[jnd...ind]))
			}
		}
	}

	return Array(zeroSums)
}

let items: [Int] = [3, 4, -7, 3, 1, 3, 1, -4, -2, -2]
let zeroSum = findZeroSum(items)
print("All sub arrays with zero sums: \n", zeroSum)
