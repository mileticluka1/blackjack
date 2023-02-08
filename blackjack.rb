# Create a deck of cards
deck = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"].product(["♠", "♣", "♦", "♥"])
deck.shuffle!

# Deal two cards to the player and two cards to the dealer
player_hand = deck.pop(2)
dealer_hand = deck.pop(2)

# Show the player's cards and the value of the hand
player_total = 0
player_hand.each do |card|
  if card[0] == "J" || card[0] == "Q" || card[0] == "K"
    player_total += 10
  elsif card[0] == "A"
    player_total += 11
  else
    player_total += card[0].to_i
  end
end

puts "Player's hand: #{player_hand} (#{player_total})"

# Show the dealer's cards and the value of the hand
dealer_total = 0
dealer_hand.each do |card|
  if card[0] == "J" || card[0] == "Q" || card[0] == "K"
    dealer_total += 10
  elsif card[0] == "A"
    dealer_total += 11
  else
    dealer_total += card[0].to_i
  end
end

puts "Dealer's hand: #{dealer_hand} (#{dealer_total})"

# Player turn: hit or stay
while player_total < 21
  puts "Would you like to hit or stay? (h/s)"
  hit_or_stay = gets.chomp

  if hit_or_stay == "h"
    player_hand << deck.pop
    player_total = 0
    player_hand.each do |card|
      if card[0] == "J" || card[0] == "Q" || card[0] == "K"
        player_total += 10
      elsif card[0] == "A"
        player_total += 11
      else
        player_total += card[0].to_i
      end
    end
    puts "Player's hand: #{player_hand} (#{player_total})"
  elsif hit_or_stay == "s"
    break
  end
end

# Determine the outcome of the game
if player_total == 21
  puts "Blackjack! You win!"
elsif player_total > 21
  puts "Bust! You lose."
else
  # Dealer turn: hit or stay
  while dealer_total < 17
    dealer_hand << deck.pop
    dealer_total = 0
    dealer_hand.each do |card|
      if card[0] == "J" || card[0] == "Q" || card[0] == "K"
        dealer_total += 10
      elsif card[0] == "A"
        dealer_total += 11
      else
        dealer_total += card[0].to_i
      end
    end

    puts "Dealer's hand: #{dealer_hand} (#{dealer_total})"

    if dealer_total == 21
      puts "Blackjack! Dealer wins."
      exit
    elsif dealer_total > 21
      puts "Bust! Player wins."
      exit
    end
  end

  if dealer_total > player_total
    puts "Dealer wins."
  elsif dealer_total < player_total
    puts "Player wins."
  else
    puts "It's a tie."
  end
end
