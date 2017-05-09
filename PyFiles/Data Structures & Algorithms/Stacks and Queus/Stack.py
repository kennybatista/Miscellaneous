#Stack

# A stack is defined by a structure and it's operations.
# A stack is LIFO - Last In, First Out

class Stack:
	def __init__(self):
		self.items = []

	# isEmpty
	def isEmpty(self):
		return self.items == []

	# size 
	def size(self):
		return len(self.items)


	# push
	def push(self, item):
		return self.items.append(item)

	# peek
	def peek(self):
		return self.items[-1]

	# pop
	def pop(self):
		return self.items.pop()






s = Stack()
s.push("Kenny")
s.push("Batista")

print(s.size())
print(s.peek())
s.pop()
print(s.peek())
print(s.isEmpty())
print(s.size())
s.pop()
print(s.size())

















