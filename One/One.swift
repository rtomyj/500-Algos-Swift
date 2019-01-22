
let numbers = [8, 7, 2, 5, 3, 1].sorted()
var seenNumbers: [[Int]]! = []
let sum: Int = 10

func findIndexes(_ numbers: [Int]) -> Dictionary<Int, [Int]>
{
	var numDict = [Int:[Int]]()
	for (index, number) in numbers.enumerated()
	{
		numDict[number, default:[Int]()].append(index)
	}

	return numDict
}


var numDict = findIndexes(numbers)

for (posA, numA) in numbers.enumerated()
{
	let numB: Int = sum - numA
	if let positionsForB = numDict[numB]
	{
		for posB in positionsForB
		{
			if posA != posB && (!seenNumbers.contains([numA, numB]) || !seenNumbers.contains([numB, numA]))
			{
				print("\(numA) + \(numB) = \(sum)")
				seenNumbers.append([numA, numB])
				seenNumbers.append([numB, numA])
			}

		}

	}
}


