def test(n, m, &blk)
  for i in n..m
    blk.call(i)
  end
end

test(3, 5) { |i| print "#{i} ... " }
puts

def repeat_range(n, m, &blk)
  (n..m).each { |i| blk.call(i) }
end
repeat_range(1, 3) { |i| print "[#{i}] " }
puts

def calc(a, b, &operation)
  operation.call(a, b)
end
puts "6 + 3 = #{calc(6, 3) { |x, y| x + y }}"
puts "6 * 3 = #{calc(6, 3) { |x, y| x * y }}"

def info(&blk)
  puts "Клас блоку: #{blk.class}"
  puts "arity: #{blk.arity}"
end
info { |a, b| a + b }

def apply_to_all(array, &blk)
  array.map(&blk)
end
p apply_to_all([1, 2, 3]) { |x| x * x }

def maybe_run(&blk)
  if blk
    blk.call
  else
    puts "Блок не передано"
  end
end
maybe_run
maybe_run { puts "Блок виконано" }

result = (1..3).map { "Вау!" }
puts result.inspect

titles = %w[ruby rails]
puts titles.map(&:capitalize).inspect

(1..3).map { word = "Вау!"; word }
begin
  puts word 
rescue NameError => e
  puts "NameError: #{e.message}"
end

word = ""
(1..3).map { word = "Вау!"; word }
puts "Зовнішня змінна змінена блоком: #{word}"

i = 0
(1..3).map do |x|
  i = x
end
puts "i = #{i}"

indexes = (1..3).map do |index|
  index
end
puts indexes.inspect