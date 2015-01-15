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