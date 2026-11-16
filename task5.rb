def sum_two(*members)
  members[0] + members[1]
end
puts "sum_two(10, 2) = #{sum_two(10, 2)}"

def sum_all(*members)
  initial = 0
  members.collect { |item| initial +=item }
  initial
end
puts "sum_all(10, 2) = #{sum_all(10, 2)}"
puts "sum_all(10, 2, 12, 34) = #{sum_all(10, 2, 12, 34)}"
puts "sum_all() = #{sum_all}"

array_to_sum = [10, 2, 12, 34]
puts "sum_all(*array_to_sum) = #{sum_all(*array_to_sum)}"

def multisum(a, b = 5, *c)
  sum = c.inject { |sum, num| sum += num }
  sum * a * b
end
puts "multisum(5, *[1, 2, 3, 4, 5]) = #{multisum(5, *[1, 2, 3, 4, 5])}"

def sum_of_array(numbers)
  numbers.sum
end
puts "sum_of_array([1, 2, 3]) = #{sum_of_array([1, 2, 3])}"

begin
  sum_of_array(1, 2, 3)
rescue ArgumentError => e
  puts "Помилка: #{e.message}"
end

def add_item!(list, item)
  list << item
end

def add_item(list, item)
  list + [item]
end

data = [1, 2]
add_item!(data, 3)
puts "Після add_item!: #{data.inspect}"
new_data = add_item(data, 4)
puts "Після add_item: оригінал #{data.inspect}, новий #{new_data.inspect}"
