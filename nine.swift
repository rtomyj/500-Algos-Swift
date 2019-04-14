var items = [0, 1, 2, 2, 1, 0, 0, 2, 0, 1, 1, 0]


func swapElements(_ items: inout [Int], _ aInd: Int, _ bInd: Int)
{
	let temp = items[aInd]
	items[aInd] = items[bInd]
	items[bInd] = temp
}


func swapSwort(_ items: inout [Int], _ lookingFor: Int, _ unsortedIndex: inout Int)
{
	for index in unsortedIndex..<items.count
	{
		if (lookingFor == items[index])
		{
			swapElements(&items, unsortedIndex, index)
			unsortedIndex += 1
		}
	}
}


func sort(_ items: inout [Int], _ asc: Bool = true)
{
	var lookingFor: Int = 0
	var increment: Int = 1
	if (!asc)
	{
		lookingFor = 2
		increment = -1
	}

	var unsortedIndex = 0
	swapSwort(&items, lookingFor, &unsortedIndex)

	lookingFor += increment
	swapSwort(&items, lookingFor, &unsortedIndex)
}


sort(&items)
print(items)

sort(&items, false)
print(items)