def reverseString(normalString):
	reversedString = ""
	for character in normalString[::-1]:
		reversedString += character
	
	return reversedString	  



reversedString = reverseString("Programming is so much fun!")
print(reversedString)