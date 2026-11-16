hello = lambda { puts "Привіт з lambda!" }
hello.call

multiply = lambda { |x, y| x * y }
puts "multiply.call(2, 3) = #{multiply.call(2, 3)}"

square = ->(x) { x**2 }
puts "square.call(5) = #{square.call(5)}"
puts "square.(6) = #{square.(6)}"

begin
  multiply.call(2)
rescue ArgumentError => e
  puts "ArgumentError (1 замість 2): #{e.message}"
end

begin
  multiply.call(2, 3, 4)
rescue ArgumentError => e
  puts "ArgumentError (3 замість 2): #{e.message}"
end

begin
  multiply.call([2, 3])
rescue ArgumentError => e
  puts "ArgumentError (масив як 1 аргумент): #{e.message}"
end

proc_multiply = Proc.new { |x, y| x * y }
puts "Proc.call([2, 3]) = #{proc_multiply.call([2, 3])}"

puts "arity lambda: #{multiply.arity}, lambda? #{multiply.lambda?}"

def lambda_return
  lambda { return "lambda" }.call
  return " lambda_return method finished "
end

def proc_return
  Proc.new { return "Proc.new" }.call
  return " proc_return method finished "
end

puts proc_return 
puts lambda_return

def make_adder(n)
  ->(x) { x + n }
end
add10 = make_adder(10)
puts "add10.call(5) = #{add10.call(5)}"