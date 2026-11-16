def sum(a, b = 5)
  a + b
end

puts "sum(10, 2) = #{sum(10, 2)}"
puts "sum(10) = #{sum(10)}"

def area(width, heit = width)
  width * heit
end
puts "area(4) = #{area(4)}"
puts "area(4, 3) = #{area(4, 3)}"

def stamp (label, time = Time.now)
  "#{label}: #{time.strftime('%H:%M:%S')}"
end
puts stamp("перший виклик")
sleep 1
puts stamp("другий виклик")

def sum(a, b)
  return a + b
end
puts "Версія з return: sum(10, 2) = #{sum(10, 2)}"

def sum(a, b)
  "сума #{a} і #{b} дорівнює #{a + b}"
end
puts sum(10, 2)

begin
  sum(10, 2)
rescue ArgumentError => e
  puts "Помилка: #{e.message}"
end


class Animal
  def speak
    "Звук тварини"
  end
end

class Dog < Animal
  def speak
    "#{super} -> Гав!"
  end
end

puts Animal.new.speak
puts Dog.new.speak
