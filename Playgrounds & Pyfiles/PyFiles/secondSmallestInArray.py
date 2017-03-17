# Input: {42,8,13,79,5,2,18}
# Output: ( second smallest) 5

def secondSmallest(ArrayOfIntegers):
	smallestToLargest = []
	for integer in ArrayOfIntegers:
		smallestInList = min(ArrayOfIntegers)
		smallestToLargest.append(smallestInList)
		ArrayOfIntegers.remove(smallestInList)

	return smallestToLargest[1]

	


secondSmallestList = secondSmallest([42,8,13,79,5,2,18])
print(secondSmallestList)