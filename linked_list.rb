require './node.rb'

class LinkedList

	attr_accessor :head

	def initialize
		@head = nil
	end

	def append(value)
		node = Node.new
		node.value = value		
		i = @head
		if i == nil
			@head = node
		else
			while i.next_node != nil
				i = i.next_node
			end
			i.next_node = node
		end
	end

	def prepend(value)
		node = Node.new
		node.value = value
		node.next_node = @head
		@head = node
	end

	def size
		count = 1
		return 0 if @head == nil
		i = @head
		while i.next_node != nil
			count += 1
			i = i.next_node
		end
		count
	end

	def head
		@head
	end

	def tail
		return nil if @head == nil
		i = @head
		while i.next_node != nil
			i = i.next_node
		end
		i
	end

	def at(index)
		return nil if @head == nil
		i = @head
		(index - 1).times do
			i = i.next_node unless i == nil
		end
		i
	end

	def pop
		return false if @head == nil
		if @head.next_node == nil
			p = @head
			@head = nil
			return p
		end
		prev = @head
		node = @head.next_node
		while node.next_node != nil
			prev = prev.next_node
			node = node.next_node
		end
		prev.next_node = nil
		node
	end

	def contains?(value)
		return false if @head == nil
		return true if @head.value == value
		i = @head
		while i.next_node != nil
			i = i.next_node
			return true if i.value == value
		end
		false
	end

	def find(value)
		return nil if @head == nil
		return 1 if @head.value == value
		i = @head
		count = 1
		while i.next_node != nil
			i = i.next_node
			count += 1
			return count if i.value == value
		end
		nil
	end

	def print_list
		if @head == nil
			puts "nil"
		else
			i = @head
			print "( #{i.value.to_s} )"
			while i.next_node != nil
				i = i.next_node
				print " -> ( #{i.value.to_s} )"
			end
			puts " -> nil"
		end
	end

	def insert_at(value, index)
		if index <= 1
			prepend(value)
		elsif index > self.size
			append(value)
		else
			node = Node.new
			node.value = value
			prev = @head
			current = @head.next_node
			(index - 2).times do
				prev = prev.next_node
				current = current.next_node
			end
			prev.next_node = node
			node.next_node = current
		end
	end

	def remove_at(index)
		if index <= 1
			@head = @head.next_node
		elsif index > self.size
			self.pop
		else
			i = @head
			(index - 2).times do
				i = i.next_node
			end
			i.next_node = i.next_node.next_node
		end
	end


end




