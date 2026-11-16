def test1
  a = 1
  puts "До yield (a = #{a})"
  yield
  puts "Після yield"
end
test1 { puts "Hello!" }

def test2
  a = 1
  yield a
end
test2 { |x| puts((2 + x).to_s + "hi") }

def test2_inline
  a = 1
  puts((2 + a).to_s + "hi")
end
test2_inline

def twice
  yield
  yield
end
twice { puts "Раз" }

def yield_two
  yield 1, 2
end
yield_two { |a, b| puts "a = #{a}, b = #{b}" }

def transform(x)
  result = yield(x)
  "Результат блоку: #{result}"
end
puts transform(4) { |n| n + 100 }

def safe(x)
  if block_given?
    yield(x)
  else
    puts "Блок не передано, x = #{x}"
  end
end
safe(3)
safe(3) { |n| puts n * 10 }

begin
  twice
rescue LocalJumpError => e
  puts "LocalJumpError: #{e.message}"
end

def each_even(array)
  array.each { |x| yield(x) if x.even? }
end
each_even([1, 2, 3, 4, 5, 6]) { |n| puts "Парне: #{n}" }