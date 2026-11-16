def greet
  puts "Hello, baby!"
end

alias baby greet

greet
baby

puts "Справжнє ім'я методу baby: #{method(:baby).original_name.inspect}"

def greet
  puts "Нова версія greet"
end

greet
baby

class Greeter
  def hello(name)
    "Привіт, #{name}!"
  end

  alias_method :hi, :hello
  alias salute hello
end

g = Greeter.new
puts g.hello("Оксана")
puts g.hi("Оксана")
puts g.salute("Оксана")

class Greeter
  alias_method :old_hello, :hello

  def hello(name)
    "[нова версія] " + old_hello(name)
  end
end

puts g.hello("Іван")
puts g.hi("Іван")