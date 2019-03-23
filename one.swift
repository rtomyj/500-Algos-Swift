/*
	A dict is used to remember a value and the index it was found in the original array.

	Traverses an array of items and subtracts sum - current value. If that result is in the dict then it means we 
	iterated over it already and we can print out the sum. 
*/
func hashAndFind(_ items: [Int], _ sum: Int)
{
	var hash = [Int: Int]()
	for (index, item) in items.enumerated()
	{
		hash[item] = index
		let operand = sum - item
		let hashIndex = hash[operand]
		if (hashIndex != nil)
		{
			print("\(item) (index = \(index)) + \(operand) (index = \(hashIndex!)) = \(sum)")
		}
	}
}

let items = [8, 7, 2, 5, 3, 1]
let sum = 10
hashAndFind(items, sum)