func hashAndFind(_ items: [Int])
{
	var hash = [Int: Bool?]()

	for item in items
	{
		if (hash[item] != nil)
		{
			print("Dup value is \(item)")
			break
		}
		else
		{
			hash[item] = true
		}
	}
}

func sortAndfind(_ items: [Int])
{
	let sortedItems = items.sorted()
	for (index, value) in sortedItems[1...].enumerated()
	{
		if (value == sortedItems[index])
		{
			print("Dup value is \(value)")
			return
		}
	}
}

let items = [1, 2, 3, 4, 4]
//let items = [1, 2, 3, 4, 2]

//hashAndFind(items)
sortAndfind(items)