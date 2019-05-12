/*
	Using an x and y graph where the x axis represents index of array and y represents the sums will help with this problem.

	Take array [1, 4, -2, 3] that produces the following graph:
	
	      #
	  #   #
	  #   #
	  # # #
	  # # #	
	# # # #
	-------------

	If we are looking for the sum 3 we can see that the sequence [1, 4, -2] will produce the longest sequence. However, 
	only having one graph isn't enough for this problem. 
	
	For example, the longest sequence producing a 4 is [4]. But in the above graph we don't see a y value of 4. So the 
	answer to "what's the longest sequence producing sum of 4" using just the above graph will be []. An incorrect answer.

	We need to keep track of every "local sum". For example, taking the sub array [1, 4] we get the following graphs:

	First Value (1)

	#
	-------

	Second Value (4)

	#
	# #
	# #										1 + 4 = 5 and 4 = 4
	# #
	# #
	------

	Here we get a y value that equals 4. We can use that to answer the question we couldn't before.

	Every new value prduces more local sums. We have to consider all local sums in an efficient manner.

	To keep track of local sums we can do the following: consider the graph again. 
	Let	x_axis = index where local sum starts - eg localSums[1] will have local sums where 4 is the starting value
			y_axis = Local sum from [startIndOfLocalSum, currentLocalSum]
*/

func findMaxLenSubarr(_ items: [Int], _ sum: Int) -> [Int]
{
	var localSums: [Int] = []	// keeps track of all local sums
	var leftRight: [Int] = [0, 0]	// start and end index of longest sequence producing sum

	for val in items
	{
		localSums.append(0)	// increases the number of local sums being tracked
		/*
			Goes through all local sums and increases the value of each local sum by the value of the current index of items 
			array.
		*/
		for (ind) in (0..<localSums.count)
		{
				localSums[ind] += val
				/*
					Since the local sums array will at most only be as big as the items array we need to see if the current local 
					sums array contains the sum we want.
					In other words, local sums array will not get infinitely big. All local sums will be overwritten by new local 
					sums. We need to find the desired sum before overwritting.
				*/
				if (localSums[ind] == sum && localSums.count - ind > leftRight[1] - leftRight[0])
				{
					leftRight = [ind, localSums.count]
				}
		}
	}

	return Array(items[leftRight[0]..<leftRight[1]])
}

var items = [5, 6, -5, 5, 3, 5, 3, -2, 0]
print(findMaxLenSubarr(items, 8))