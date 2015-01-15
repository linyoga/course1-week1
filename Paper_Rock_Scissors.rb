#paper rock scissors.rb
#同樣的時候平手，P > R, R > S, S > P
begin
puts "Play Paper Rock Scissors!"

puts "Choose one: (P/R/S)"

human = gets.chomp

case human
when 'P'
  human = "Paper"
when 'R'
  human = "Rock"
when 'S'
  human = "Scissors"  
end

cpu = rand(3) + 1

case cpu
when 1
  cpu = "Paper"
when 2
  cpu = "Rock"
when 3
  cpu = "Scissors"  
end

puts "You Picked #{human} and computer picked #{cpu}"

if human == cpu
  puts "it's tie"
elsif (human == "Paper" && cpu == "Rock") || (human == "Rock" && cpu == "Scissors") ||(human == "Scissors" && cpu == "Paper")
  puts "You won!"
else
  puts "You lose!"
end
puts "Play again?(Y/N)"
answer = gets.chomp
end while answer == "Y" || answer == "y"