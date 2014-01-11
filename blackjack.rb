def deck
	value = %w[A 2 3 4 5 6 7 8 9 10 J Q K]
	suit	= %w[S H D C]
	suit.product(value).shuffle
end
def deal_card hand_card
		if hand_card.nil?  
			hand_card = deck.pop(2) 
		else	
			hand_card << deck.pop
		end
		hand_card
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
		end
	end
	puts "here is your total points :" + total_points.to_s
		
end

def continue (str,player_card)
	while str == "hits"
	player_card = deal_card player_card
	print player_card.to_s
	total_value player_card
	puts "Hits or Stay"
	str = gets.chomp.downcase 
end
end
print "Welcome to Blackjack Game. what's your name?"
player_name = gets.chomp
puts "hello " + player_name + ' here are your two cards :'
player_card = deal_card player_card
print player_card.to_s 
total_value player_card
puts "hits or stay"
answer = gets.chomp.downcase
continue(answer,player_card)


 