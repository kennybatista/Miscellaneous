# We create the node class, the node itself takes in data, and a pointer for the next node.
# 

class Node(object):
	def __init__(self, data_value=None, next_node_pointer=None):
		self.data_value = data_value
		self.next_node_pointer = next_node_pointer 

	# Convenience methods

	def get_data_value(self):
		return self.data_value 

	def get_next(self):
		return self.next_node_pointer

	def set_next(self, new_next): 
		self.next_node_pointer = new_next 


class LinkedList(object):
	def __init__(self, head=None):
		self.head = head 

	# Insert method
	def insert(self, data_value):
		# creates a new node, sets the given data inside the node
		new_node = Node(data_value)
		# sets the pointer of the current node to point at the head ( first element in linked list)
		new_node.set_next(self.head) 
		# we set the new as the head of the list
		self.head = new_node

	# Size method 	
	def size(self):
		
		current = self.head
		count = 0
		while current:
			count += 1
			current = current.get_next()
		return count

	def search(self, data_value):
		current = self.head
		found = False
		while current and found is False:
			if current.get_data_value() == data_value:
				found = True 
			else:
				current = current.get_next()
		if current is None:
			raise ValueError("data value not in list")
		return current

	def delete(self, data_value):
		current = self.head
		previous = None
		found = False 
		while current and found is False:
			if current.get_data_value() == data_value:
				found = True
			else:
				previous = current
				current = current.get_next()
		if current is None:
			raise ValueError("Data Value not in list")
		if previous is None:
			self.head = current.get_next()
		else:
			previous.set_next(current.get_next())


ll = LinkedList()

ll.insert("Hello")	
ll.insert("World")
ll.insert("I")
ll.insert("am")
ll.insert("Kenny")

size = ll.size()
print(size)




