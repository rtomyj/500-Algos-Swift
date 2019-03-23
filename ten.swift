/*
	Swaps elements of two arrays. Uses the first element of one array an index to get the other element of the other array.
*/
func swap(_ x: inout [Int], _ xInd: Int, _ y: inout [Int])
{
	let temp = x[xInd]
	x[xInd] = y[0]
	y[0] = temp
}


/*
	Uses thefact that y is always sorted to keep both x and y sorted.
	If x[index] is greater than y[0] then we swap. After which we resort the array.
*/
func sortTwoArrays(_ x: inout [Int], _ y: inout [Int])
{
	for (xInd, item) in x.enumerated()
	{
		if (item > y[0])
		{
			swap(&x, xInd, &y)
			y.sort()
		}
	}
}

var x = [1, 4, 7, 8, 10]
var y = [2, 3, 9]
sortTwoArrays(&x, &y)
print(x)
print(y)