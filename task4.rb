require "date"

class Broom
  def +(another)
    12 + another
  end
end

whisk = Broom.new
puts "whisk + 10 = #{whisk + 10}"
puts "whisk.+(10) = #{whisk.+(10)}"

t = Time.now
puts "Зараз:            #{t.strftime('%H:%M:%S')}"
d = Date.today
puts "Сьогодні: #{d}, d + 1 = #{d + 1}"

class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def +(other)
    Point.new(x + other.x, y + other.y)
  end

  def *(number)
    Point.new(x * number, y * number)
  end

  def ==(other)
    other.is_a?(Point) && x == other.x && y == other.y
  end
  
  def to_s
    "(#{x}, #{y})"
  end
end

p1 = Point.new(1, 2)
p2 = Point.new(3, 4)
puts "p1 + p2 = #{p1 + p2}"
puts "p1 *3 = #{p1 * 3}"
puts "p1 == Point.new(1, 2): #{p1 == Point.new(1, 2)}"
puts "p1 == p2: #{p1 == p2}"

class Bottle
  def capacity
    @capacity
  end

  def capacity=(new_cap)
    @capacity = new_cap
  end
end

btl = Bottle.new
btl.capacity = 10
puts "Місткість: #{btl.capacity}"
puts "Значення виразу присвоєння:#{(btl.capacity = 20)}"
btl.send(:capacity=, 30)
puts "Після send: #{btl.capacity}"

class Person
  attr_reader :age

  def age=(value)
    raise ArgumentError, "Вік не може бути від'ємним" if value.negative?
      @age = value
  end
end

person = Person.new
person.age = 25
puts "Вік: #{person.age}"
begin
  person.age = -5
rescue ArgumentError => e
  puts "Помилка: #{e.message}"
end