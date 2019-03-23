/*
	Uses a dict to keep track of number occurrences. If dict has a key then it means the value was seen before in items array (dup).
	
	Not constant space. O(N) complexity.
*/
func hashAndGrab(_ items: [Int])
{
	var hash = [Int: Bool?]()

	for item in items
	{
		if (hash[item] != nil)
		{
			print("Dup element is \(item)")
			break
		}
		else
		{
			hash[item] = true
		}
	}
}


/*
	Array is sorted. After which the adjacent elements are checked. Sorted adjacent elements are either dups or not.

	Constant Sapce O(N).
*/
func sortAndfind(_ items: [Int])
{
	let sortedItems = items.sorted()
	for (index, value) in sortedItems[1...].enumerated()
	{
		if (value == sortedItems[index])
		{
			print("Dup element is \(value)")
			return
		}
	}
}

var items = [1, 2, 3, 4, 2]
hashAndGrab(items)

items = [1, 2, 3, 4, 4]
sortAndfind(items)