greeting = Proc.new do
  puts "Ваше здоров'я"
end
greeting.call
greeting.()
greeting[]

square = Proc.new { |n| n * n }
puts "square.call(5) = #{square.call(5)}"

def make_multiplier(factor)
  return Proc.new { |n| n * factor }
end

times3 = make_multiplier(3)
times5 = make_multiplier(5)
puts "times5.call(7) = #{times5.call(7)}"
puts "times3.call(12) = #{times3.call(12)}"
puts "times3.call(times5.call(4)) = #{times3.call(times5.call(4))}"

abc = Proc.new { |a, b, c| [a, b, c] }
puts "call(1, 2, 3)          => #{abc.call(1, 2, 3).inspect}"
puts "call(1, 2)             => #{abc.call(1, 2).inspect}" 
puts "call(1, 2, 3, 4, 5)    => #{abc.call(1, 2, 3, 4, 5).inspect}"
puts "call()                 => #{abc.call.inspect}"
puts "call([7, 8, 9])        => #{abc.call([7, 8, 9]).inspect}"

puts "Proc.new{}.arity          = #{Proc.new {}.arity}"
puts "Proc.new{|a|}.arity       = #{Proc.new { |a| }.arity}"
puts "Proc.new{|*a|}.arity      = #{Proc.new { |*a| }.arity}"
puts "Proc.new{|a, *b|}.arity   = #{Proc.new { |a, *b| }.arity}"
puts "lambda? #{abc.lambda?}"

def proc_return
  Proc.new { return "Proc.new" }.call
  return " proc_return method finished "
end

puts proc_return

def proc_next
  pr = Proc.new { next "next із Proc" }
  value = pr.call
  "Метод продовжив роботу, Proc повернув: #{value}"
end
puts proc_next

def make_returning_proc
  Proc.new { return 1 }
end

orphan = make_returning_proc
begin
  orphan.call
rescue LocalJumpError => e
  puts "LocalJumpError: #{e.message}"
end