def greet(name:, age: nil, city: "Unknown")
  text = "Привіт, #{name}! "
  text += "Вік: #{age}. " if age
  text += "Місто: #{city}."
  text
end

puts greet(name: "Оксана")
puts greet(name: "Оксана", age: 20)
puts greet(city: "Івано-Франківськ", name: "Іван", age: 25)

begin
  greet(age: 20)
rescue ArgumentError => e
  puts "Помилка: #{e.message}"
end

begin
  greet(name: "Оксана", country: "Україна")
rescue ArgumentError => e
  puts "Помилка: #{e.message}"
end

def greet_positional(name, age = nil, city = "Unknown")
  "#{name}, #{age.inspect}, #{city}"
end
puts greet_positional("Оксана", 20, "Київ")
puts greet_positional("Оксана", "Київ")
