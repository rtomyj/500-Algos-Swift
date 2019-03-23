func swap(_ x: inout [Int], _ xInd: Int, _ y: inout [Int])
{
	let temp = x[xInd]
	x[xInd] = y[0]
	y[0] = temp
}

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