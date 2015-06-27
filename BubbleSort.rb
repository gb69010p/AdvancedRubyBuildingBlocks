def bubble_sort(list)
	last = list.size - 1
	swapped = true
	
	# Continues running another pass until no swaps have been made
	while swapped
		swapped = false
		idx = 0

	# Checks current and next index
		while idx < last
			if list[idx] > list[idx+1]
				list[idx], list[idx+1] = list[idx+1], list[idx]
				swapped = true # Triggers another pass
			end
			idx += 1
		end
		# p "end idx #{idx}: #{list}" # Debugging: Shows last index checked with list
		last -= 1 # Update last index to ignore correctly placed values
	end

	list
end

nums = [2346, 908, 72708, 2, 115546, 444, 6742, 5, 765]
p bubble_sort(nums)

# TEST OUTPUT
# nums = [5, 7, 4, 1, 9, 3]
# p bubble_sort(nums)
# 	=> [1, 3, 4, 5, 7, 9]


def bubble_sort_by(list)
	last = list.size - 1
	swapped = true
	
	# Continues running another pass until no swaps have been made
	while swapped
		swapped = false
		idx = 0

	# Checks current and next index
		while idx < last
			result = yield(list[idx], list[idx+1]) # Positive = right larger and swap, negative = left smaller - do nothing, zero = equal - do nothing
			if result > 0
				list[idx], list[idx+1] = list[idx+1], list[idx]
				swapped = true # Triggers another pass
			end
			idx += 1
		end
		# p "end idx #{idx}: #{list}" # Debugging: Shows last index checked with list
		last -= 1 # Update last index to ignore correctly placed values
	end

	list
end

string_list = ["herrro", "i", "love" "gregpup", "soooooo", "much", "alyssaburnsseidel", "alyssaseidelburnzzz", "chestercutepup", "sharks", "bambin"]
p bubble_sort_by(string_list) {|left,right| right.length - left.length }

# TEST OUTPUT
# string_list = ["hi", "hello", "hey"]
# p bubble_sort_by(string_list) {|left,right| right.length - left.length }
# 	=> ["hello", "hey", "hi"]