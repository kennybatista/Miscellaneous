# Queues are FIFO


class Queue:
	def __init__(self):
		self.items = []


	# isEmpty
	def sEmpty(self):
		return self.items == []


	# size
	def size(self):
		return len(self.items)

	# enqueue
	def enqueue(self, item):
		return self.items.insert(0, item)

	# dequeue
	def dequeue(self):
		return self.items.pop()