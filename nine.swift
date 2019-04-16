var items = [0, 1, 2, 2, 1, 0, 0, 2, 0, 1, 1, 0]


/*
	Swaps two elements within the same list at given indices.
*/
func swapElements(_ items: inout [Int], _ aInd: Int, _ bInd: Int)
{
	let temp = items[aInd]
	items[aInd] = items[bInd]
	items[bInd] = temp
}


/*
	Sorts an array partially by swapping a desired element with an index not yet sorted.
	Ideally to sort an array this method will be called multiple times.
	If there are n possible values for an element then this method should be called n-1 times.
*/
func swapSwort(_ items: inout [Int], _ lookingFor: Int, _ unsortedIndex: inout Int)
{
	for index in unsortedIndex..<items.count
	{
		/*
			Swaps current value with the value at the unsorted index if current value is the current wanted value.
		*/
		if (lookingFor == items[index])
		{
			swapElements(&items, unsortedIndex, index)
			unsortedIndex += 1
		}
	}
}


/*
	Sorts an array that contains 0's, 1's and 2's.
	Sorting should use constant space and be done in linear time.
*/
func sort(_ items: inout [Int], _ asc: Bool = true)
{
	/*
		Default values for ascending sort.
	*/
	var leftMostValue: Int = 0
	var increment: Int = 1

	/*
		Changes values for descending sort.
	*/
	if (!asc)
	{
		leftMostValue = 2
		increment = -1
	}

	var unsortedIndex = 0
	swapSwort(&items, leftMostValue, &unsortedIndex)	// partially sorts array (either 0 (asc) or 2 (desc) are all sorted)
	swapSwort(&items, (leftMostValue + increment), &unsortedIndex)	// array is sorted
}


/*
	Main functionality
	Completes algorithm 9.
*/
sort(&items)	// sorts 0's, 1's and 2's in ascending order
print(items)

sort(&items, false)	// sorts 0's, 1's and 2's in descending order
print(items)