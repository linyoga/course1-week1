def deck
	value = %w[A 2 3 4 5 6 7 8 9 10 J Q K]
	suit	= %w[S H D C]
	suit.product(value).shuffle!
end

def total_value hand_card
	total_points = 0
	ace = 0
	hand_card.each do |deck|
		case deck[1]
		when "A"
			points = 11
			ace += 1 
		when "10", "J", "Q", "K"
			points = 10
		when "2", "3", "4", "5", "6", "7", "8", "9"
			points = deck[1].to_i
		end
		total_points += points
		while total_points > 21 && ace > 0
			total_points -= 10
			ace -= 1 
		end
	end
	total_points
end

def gameover
	while true
	puts "Continue Playing Y or N ?"
	yes_no = gets.chomp.downcase
		if !['y', 'n'].include?(yes_no)
			puts "you must enter Y or N"
			next
		end
	if yes_no == "n"
		puts "Game over"
		exit
	elsif yes_no
		break
	end
	end		
end

game = "Y"
while game == "Y"
print "Welcome to Blackjack Game. what's your name?"
player_name = gets.chomp
player_card = []
dealer_card = []

player_card << deck.pop
dealer_card << deck.pop
player_card << deck.pop
dealer_card << deck.pop

player_points = total_value player_card
dealer_points = total_value	dealer_card

puts  "#{player_name}'s cards : #{player_card[0]} and #{player_card[1]}, points are #{player_points}"
puts	"dealer's cards : #{dealer_card[0]} and #{dealer_card[1]}, total points are #{dealer_points}"

if player_points == 21
	puts "Blackjack!!! YOU WIN!!"
	gameover
end
while player_points < 21
	puts "what would you choose? hits or stay"
	answer = gets.chomp.downcase

	if !['hits', 'stay'].include?(answer)
		puts "you must enter hits or stay"
		next
	end
# stay part	
	if answer == "stay" 
		while  dealer_points < 17
			dealer_card << deck.pop
			dealer_points = total_value(dealer_card)
			puts  "dealer's cards : #{dealer_card}, points are #{dealer_points}"
		end
		case 
		when dealer_points > 21
			puts "dealer busted! YOU WIN"
		when dealer_points < player_points	
			puts "YOU WIN!!"
		when dealer_points >= player_points	
			puts "YOU LOSE"
		end
	gameover
	break
	end
#hits part
		player_card << deck.pop
		player_points = total_value player_card
		puts  "#{player_name}'s cards : #{player_card}, points are #{player_points}"
		if player_points == 21
			puts "BlackJack!! YOU WIN!!"
			gameover
		elsif player_points > 21
			puts "Sorry, You busted!! You Lose"		
			gameover
		end
end
end

