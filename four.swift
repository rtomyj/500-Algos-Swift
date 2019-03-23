/*
	Loops through bin array. If leftMostValue is spotted it is added to the left side of the array. To keep track of 
	where on the left we want it leftMostCount is used.

	After the first loop is done, the left side of the array is sorted. To sort the right side we use the second loop to 
	add elements equal to len - leftMostCount to push the opposite of leftMostValue.
*/
func fillAndAdd(_ items: inout [Int], leftMostValue: Int = 0)
{
	var leftMostNum: Int = 0
	for (value) in items
	{
		if (value == leftMostValue)
		{
			items[leftMostNum] = leftMostValue
			leftMostNum += 1
		}
	}

	let rightMostValue = leftMostValue == 0 ? 1 : 0 
	for i in leftMostNum..<items.count
	{
		items[i] = rightMostValue
	}

}


/*
	Creates two arrays. One with the left side of the sorted array, and the other with the right side. Both are then 
	merged and returned as a new array.
*/
func mergeTwoArrays(_ items: [Int], leftMostValue: Int = 0) -> [Int]
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

	return sortedItems
}

var items = [1, 0, 1, 0, 1, 0, 0, 1]
fillAndAdd(&items, leftMostValue: 0)
print(items)
let sortedItems = mergeTwoArrays(items, leftMostValue: 1)
print(sortedItems)