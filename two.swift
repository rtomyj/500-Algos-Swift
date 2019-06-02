func findZeroSum(_ items: [Int]) -> [Int]
{
	var sum = 0
	var graph = [Int:Int]()
	graph[0] = -1	// key is y axis and value is x axis

	for (ind, item) in items.enumerated()
	{
		sum += item
		if (graph[sum] == nil)
		{
			graph[sum] = ind
		}
		else
		{
			return Array(items[graph[sum]! + 1...ind])
		}
	}
	return Array([])
}

let items: [Int] = [3, 4, -7, 3, 1, 3, 1, -4, -2, -2]
let zeroSum = findZeroSum(items)
print("Sub array with zero sum: \n", zeroSum)
