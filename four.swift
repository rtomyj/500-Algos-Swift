func fillAndAdd(_ items: inout [Int], leftMostValue: Int = 0)
{
	let rightMostValue = leftMostValue == 0 ? 1 : 0 
	var leftMostNum: Int = 0

	for (value) in items
	{
		if (value == leftMostValue)
		{
			items[leftMostNum] = leftMostValue
			leftMostNum += 1
		}
	}

	for i in leftMostNum..<items.count
	{
		items[i] = rightMostValue
	}
	print(items)

}

func mergeTwoArrays(_ items: [Int], leftMostValue: Int = 0)
{
	var leftMostNum = 0
	for (value) in items
	{
		if (value == leftMostValue)
		{
			leftMostNum += 1
		}
	}
	var sortedItems = Array(repeating: leftMostValue, count: leftMostNum)
	let rightMostValue = leftMostValue == 0 ? 1 : 0 
	sortedItems += Array(repeating: rightMostValue, count: items.count - leftMostNum)
	print(sortedItems)
}

var items = [1, 0, 1, 0, 1, 0, 0, 1]
//fillAndAdd(&items, leftMostValue: 0)
mergeTwoArrays(items, leftMostValue: 1)