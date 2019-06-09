/*
	The situation is similar to problem 2. However, now we have to keep track of all occurences.

	Thinking again about a graph, we see that there will be different local graphs - I'll call them graphs.

	Eg) [3, -3, 2, -2]
	We can see that there will be 3 sub arrays that produce a zero sum: [3, -3], [3, -3, 2, -2], [2, -2].

	If we do the problem the same way as problem two, we will miss some zero graphs since our graph kept track of only one
	zero sum occurence that produced the same y value. In other words: since the graph starts at 0, and all our sub arrays
	go back to 0, we will override previous values since we only keep track of one occurence, we will ignore other
	occurences or we will miss occurences. In the example above all three can happen. See below.

	First occurence: [3, -3] @ indexes [0, 2)
	Override: Once we see [2, -2] our indexes can shift to indexes [2, 4)
	Ignore: If we don't allow overriding we will miss the above occurence
	Missed: What about [3, -3, 2, -2] @ indexes [0, 4)?  How can we account for it.

	To solve this problem it is better to think of every element as spawning a new graph. If we take the above sequence
	again:
	Ind: 0
	Elements added: [3]
	Graph(s):
		Graph 1
	#
	#
	#
	--------
	1

	Ind: 1
	Elements added: [3, -3]
	Graph(s):
		Graph 1					Graph 2
	#
	#
	#									1
	--------					-------
	1	2								#
										#
										#

	Ind: 2
	Elements added: [3, -3, 2]
	Graph(s):
		Graph 1						Graph 2						Graph 3
	#
	#		#																		#
	#		#								1	2									#
	----------					----------					----------
	1	2	3								#	#									1
											#
											#

	Ind: 3
	Elements added: [3, -3, 2. -2]
	Graph(s):
		Graph 1						Graph 2						Graph 3						Graph 4
	#
	#		#																		#
	#		#								1	2	3								#								1
	----------					----------					----------			----------
	1	2	3	4							#	#	#								1	2							#
											#		#																#
											#		#

	With the above graphs, we can see that zero graphs occur when the y-ind of each graph is 0.
	This happnes twice in graph 1, and once in graph 3.
	Using the x values we see this happens with indexes [0, 2) and [0, 4) in graph 1 and [0, 2) in graph 2.

	Since Graph 1 encompasses all original indexes we see that [0, 2) = [3, -3] and [0, 4) = [3, -3, 2, -2].
	However, Graph 2 only considers the sub array [2 -2], so [0, 2) for Graph 2 is equal to [2, -2]
*/

func findZeroSum(_ items: [Int]) -> [[Int]]
{
	var graphs = [Int]()	// each index will be graph X and each value will be sum at given index for graph X (see above)
	var zeroSums = [[Int]]()	// array holding all sub arrays with 0 graphs

	for (ind, item) in items.enumerated()
	{
		graphs.append(item)

		/*
			By default, a value of 0 is a zero sum.
		*/
		if (item == 0)
		{
			zeroSums.append([0])
		}

		/*
			Increases sum for each graph except the last one.
		*/
		for jnd in (0..<graphs.count - 1)
		{
			graphs[jnd] += item

			/*
				If after adding the current element to the graph sum we get a 0, then we found a zero sum sub array from -
				[graph X, currentInd]
			*/
			if (graphs[jnd] == 0)
			{
				zeroSums.append(Array(items[jnd...ind]))
			}
		}
	}

	return Array(zeroSums)
}

let items: [Int] = [3, 4, -7, 3, 1, 3, 1, -4, -2, -2]
let zeroSum = findZeroSum(items)
print("All sub arrays with zero graphs: \n", zeroSum)
