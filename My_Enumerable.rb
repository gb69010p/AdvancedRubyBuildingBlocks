module Enumerable

	def my_each
		for i in 0...self.length
			yield(self[i])
		end
		self
	end

	def my_each_with_index
		for i in 0...self.length
			yield(self[i], i)
		end
		self
	end

	def my_select
		selection = []
			self.my_each do |val|
				selection << val if yield(val)
			end
		selection
	end

	def my_all?
		self.my_each {|val| return false if !yield(val)}
		true
	end

	def my_any?
		self.my_each {|val| return true if yield(val)}
		false
	end

	def my_none?
		self.my_each {|val| return false if yield(val)}
		true
	end

	def my_count
		total = 0
		self.my_each {|val| total += 1 unless val.nil?}
		total
	end

	def my_map
		collection = []
		self.my_each {|val| collection << yield(val)}
		collection
	end

	def my_inject(initial=nil)
		if initial.nil?
			total = self[0]
			arr = self[1...self.length]
			arr.my_each {|val| total = yield(total, val)}
		else
			total = initial
			self.my_each {|val| total = yield(total, val)}
		end
		total
	end

end

arr = [1, 2, 3]

# TEST OUTPUT
# my_each
# p arr.each {|val| p val}
# p arr.my_each {|val| p val}
# =>
# 1
# 2
# 3
# [1, 2, 3]

# my_each_with_index
# p arr.each_with_index {|val, idx| p "value: #{val}, index: #{idx}"}
# p arr.my_each_with_index {|val, idx| p "value: #{val}, index: #{idx}"}
# =>
# "value: 1, index: 0"
# "value: 2, index: 1"
# "value: 3, index: 2"
# [1, 2, 3]

# my_select
# p arr.select {|val| val > 1}
# p arr.my_select {|val| val > 1}
# => [2, 3]
# p arr.my_select {|val| val < 1}
# => []

# my_all?
# p arr.all? {|val| val < 5}
# p arr.my_all? {|val| val < 5}
# => true
# p arr.all? {|val| val > 4}
# p arr.my_all? {|val| val > 4}
# => false

# my_any?
# p arr.any? {|val| val == 2}
# p arr.my_any? {|val| val == 2}
# => true
# p arr.any? {|val| val == 5}
# p arr.my_any? {|val| val == 5}
# => false

# my_none?
# p arr.none? {|val| val == 2}
# p arr.my_none? {|val| val == 2}
# => false
# p arr.none? {|val| val == 5}
# p arr.my_none? {|val| val == 5}
# => true

# my_count
# p arr.count
# p arr.my_count
# => 3

# my_map
# p arr.map {|val| val * 2}
# p arr.my_map {|val| val * 2}
# => [2, 4, 6]

# my_inject
# p arr.inject {|total, val| total + val}
# p arr.my_inject {|total, val| total + val}
# => 6
# p arr.inject {|total, val| total ** val}
# p arr.my_inject {|total, val| total ** val}
# => 1
# p arr.inject(2) {|total, val| total ** val}
# p arr.my_inject(2) {|total, val| total ** val}
# => 64