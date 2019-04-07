var x = [0, 2, 0, 3, 0, 5, 6, 0, 0]
var y = [1, 8, 9, 10, 15]

var emptyCells: [Int] = []
var xInd = 0
var yInd = 0

while (yInd < y.count)
{
	if (xInd == x.count)
	{
		x[emptyCells[0]] = y[yInd]
		emptyCells.remove(at: 0)
		yInd += 1
		continue
	}

	let xEle = x[xInd]
	let yEle = y[yInd]

	if (xEle == 0)
	{
		emptyCells.append(xInd)
		xInd += 1
	}
	else
	{
		if (xEle > yEle)
		{
			if (emptyCells.count > 0)
			{
				x[emptyCells[0]] = yEle
				emptyCells.remove(at: 0)
				yInd += 1
			}
			else
			{
				x[xInd] = yEle
				y[yInd] = xEle
				xInd += 1
			}
		}
		else
		{
			if (emptyCells.count > 0)
			{
				x[emptyCells[0]] = xEle
				x[xInd] = 0
				emptyCells.remove(at: 0)
				emptyCells.append(xInd)
			}
			xInd += 1
		}
	}

}

print(x)