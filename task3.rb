def less_than_three?(x)
  x < 3
end

puts "less_than_three?(2) = #{less_than_three?(2)}"
puts "less_than_three?(5) = #{less_than_three?(5)}"

arr = []
if arr.length == 0
  puts "Класично: empty"
end

if arr.empty?
  puts "З предикатом: empty"
else
  puts "not empty"
end

arr = [1, 2, 3]
p "Array has something" if arr.any?

def adult?(age) #власний предикат
  age >= 18
end

def palindrome?(text)
  cleaned = text.downcase.delete(" ")
  cleaned == cleaned.reverse
end

puts "adult?(20) = #{adult?(20)}"
puts "adult?(15) = #{adult?(15)}"
puts "palindrome?('Пилип') = #{palindrome?('Пилип')}"
puts "palindrome?('Ruby') = #{palindrome?('Ruby')}"

numbers = [1, 2, 3, 4, 5]
puts "Менші за 3: #{numbers.select { |n| less_than_three?(n) }.inspect}"

class Account
  attr_reader :balance

  def initialize(balance)
    @balance = balance
  end

  def empty?
    balance.zero?
  end

  def enough?(amount)
    balance>=amount
  end
end

acc = Account.new(100)
puts "Рахунок порожній? #{acc.empty?}"
puts "Вистачає 150? #{acc.enough?(150)}"
puts "Вистачає 50? #{acc.enough?(50)}"

acc = Account.new(100)
puts "Рахунок порожній? #{acc.empty?}"
puts "Вистачає 150? #{acc.enough?(150)}"
puts "Вистачає 50? #{acc.enough?(50)}"

string = "Some string with spaces ".dup
p string.strip!

class String
  def change_color!
    self.gsub!(/yellow/, "red")
  end
end

a = "yellow submarine".dup
puts "initial value of a: #{a}"
puts "Object id of 'a': #{a.object_id}"
a.change_color!
puts "Object id of 'a': #{a.object_id}"
puts "Value of 'a': #{a}"