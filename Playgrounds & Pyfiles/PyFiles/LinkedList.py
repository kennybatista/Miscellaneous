# Linked List

class Node:
	def __init__(self, initData):
		self.data = initData
		self.next = None


	def getData(self):
		return self.data

	def getNext(self):
		return self.next

	def setData(self, newData):
		self.data = newData 

	def setNext(self, newNext):
		self.next = newNext



node = Node("Kenny")
node.setData("Batista")
print(node.getData())



# the unordered list class

class UnorderedList:
	def __init__(self):
		self.head = None

	def isEmpty(self):
		return self.head == None

	def add(self, item):
		temp = Node(item)
		temp.setNext(self.head)
		self.head = temp


	def size(self):
		current = self.head 
		count = 0 

		if current != None:
			count + 1
			current.getNext()

		return count

	def search(self, item):
		current = self.head 
		found = False

		while current != None and not found:
			if current.getData == item:
				found = True
			else:
				curent = current.getNext()

		return found


	def remove(self, item):
		current = self.head
		previous = None 
		found = False

		while not found:
			if current.getData() == item:
				found = True
			else: 
				previous = current
				current = current.getNext()

		if previous == None:
			self.head = current.getNext()
		else:
			previous.setNext(current.getNext())












	# size, search, remove - done through traversing the linked list


myList = UnorderedList()