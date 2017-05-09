# Binary Search

#Iteratively
def binarySearch(list, item):
	first = list[0]
	last = list[-1]
	found = False


	while first <= last and not found:
		midpoint = (first + last) / 2

		if item == midpoint:
			return True
		else :
			if item < list[midpoint]:
				last = midpoint - 1

			else:
				first = midpoint + 1


	return found



testList = [0,1,2,3,4,5,6,7,8,9,10]
print(binarySearch(testList, 2))




