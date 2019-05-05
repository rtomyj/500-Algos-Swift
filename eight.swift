/*
	This algorithm is similar to something like, "Find the longest sub array with sum = x". The trick is to imagine
	a graph and find the two points that when connected have a slope of 0 (ie no change).

	For example: Given sequence [1, 0, 1, 1, 0, 1, 0] we can map the occurence of 0 with -1 and 1 with +1. We also must
	start at a certain value - 0 in our case:
		0 -> -1
		1 -> +1
		sum -> 0

	Obviously the greatest sub array with even number of 0's and 1's of the above sequence
	is [0, 1, 1, 0, 1, 0]. Drawing the graph we get

		3
		2		| | | |#| |#| |
		1		|#| |#|#|#|#|#|
		0		-------------
		-1

	The y value of index 1 is 0 and the y value of index 6 is 1... Connecting the points we get a change of 1.
	Not quite what we wanted. But index 0 has a y value of 1 which is a pattern we can use.

	In other words sum[0] == sum[6] (no change) so there is a sub array from range [1, 6] ([0 + 1, 6])
	that has equal 0's and 1's.
*/

func getMaxLenSubarr(_ items: [Int]) -> [Int]
{
	var sum = 0	// starting value
	var SUM_maps_LEFT_RIGHT_OCCURANCE = [Int: [Int]]()	// since we start at sum 0 we store first occurence of 0 sum
	var sumValue = [-1, 1]	// maps 0 and 1 to -1 and 1

	for (ind, val) in items.enumerated()
	{
		sum += sumValue[val]	// finds next value of y value in graph
		if (SUM_maps_LEFT_RIGHT_OCCURANCE[sum] == nil)
		{
			// the y value was not put in graph yet - add it (offset of 1 explained above)
			SUM_maps_LEFT_RIGHT_OCCURANCE[sum] = [ind + 1, -1]
		}
		else
		{
			// the y value was seen already - update the right most occurence of it (offset of 1 since we need to inclde ind
			// in range)
			SUM_maps_LEFT_RIGHT_OCCURANCE[sum]![1] = ind + 1
		}
	}

	/*
		Finds MAX length sub array.
		Each key (sum) maps to an array where [0] is first left most occurence and [1] is last right most occurence in
		original array.
		If right most occurence is -1 it means there was not right most occurence for given sum.
	*/
	var maxLen = 0
	var left: Int = 0, right: Int = 0
	for leftRight in SUM_maps_LEFT_RIGHT_OCCURANCE.values
	{
		if (leftRight[1] != -1 && leftRight[1] - leftRight[0] > maxLen)
		{
			maxLen = leftRight[1] - leftRight[0]
			left = leftRight[0]
			right = leftRight[1]
		}
	}

	return Array(items[left..<right])
}

var items = [1, 0, 1, 1, 0, 1, 0]
print(getMaxLenSubarr(items))
items = [0, 0, 1, 0, 1, 0, 0]
print(getMaxLenSubarr(items))

