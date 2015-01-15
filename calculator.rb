#calculator.rb

begin
  puts "please input your number:"
  num1 = gets.chomp

  puts "please input your number:"
  num2 = gets.chomp

  puts "please input your choice: 1.add 2.subtract 3.multiply 4.divide"
  operator = gets.chomp

  case operator
  when '1'
    result = num1.to_i + num2.to_i
  when '2'
    result = num1.to_i - num2.to_i
  when '3'
    result = num1.to_i * num2.to_i
  when '4'
    result = num1.to_f / num2.to_f
  else
    puts "please choice between 1 ~ 4"
  end

  puts "your answer is #{result}"

end while result == 'nil'
