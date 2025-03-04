require "./card"
require "./deck"
require "./turn"
require "./player"

require "pry"

class WeFight

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @round = Turn.new(@player1, @player2)
    @card53 = Card.new(:hearts, "Fake", 1)
  end

  def start

    @round_count = 0

    until @player1.has_lost? == true || @player2.has_lost? == true || @round_count == 1000000 || @player1.deck.cards.count < 1 || @player2.deck.cards.count < 1 do
      @round_count += 1
            if @round.type == :mutually_assured_destruction
              puts "Turn #{@round_count}: *mutually assured destruction* 6 cards removed from play."
            elsif @round.type == :war
              puts "Turn #{@round_count}: WAR - #{@round.winner.name} has won 6 cards."
            elsif @round.type == :basic
              puts "Turn #{@round_count}: #{@round.winner.name} has won 2 cards."
            else
              break
            end
      @round.pile_cards
      winner = @round.winner
      @round.award_spoils(winner)
    end
    # binding.pry

    if @player1.has_lost? == true
      puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    elsif @player2.has_lost? == true
      puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    elsif @round_count == 1000000
      puts "--- Draw ---"
    elsif @round.type == :basic
      puts "Not enough cards to continue play."
      if @player1.deck.cards.count > @player2.deck.cards.count
        puts "#{@player1.name} has more cards and wins the game!"
      else
        puts "#{@player2.name} has more cards and wins the game!"
      end
    end

  end
end

card1 = Card.new(:club, "2", 2)
card2 = Card.new(:club, "3", 3)
card3 = Card.new(:club, "4", 4)
card4 = Card.new(:club, "5", 5)
card5 = Card.new(:club, "6", 6)
card6 = Card.new(:club, "7", 7)
card7 = Card.new(:club, "8", 8)
card8 = Card.new(:club, "9", 9)
card9 = Card.new(:club, "10", 10)
card10 = Card.new(:club, "Jack", 11)
card11 = Card.new(:club, "Queen", 12)
card12 = Card.new(:club, "King", 13)
card13 = Card.new(:club, "Ace", 14)
card14 = Card.new(:diamond, "2", 2)
card15 = Card.new(:diamond, "3", 3)
card16 = Card.new(:diamond, "4", 4)
card17 = Card.new(:diamond, "5", 5)
card18 = Card.new(:diamond, "6", 6)
card19 = Card.new(:diamond, "7", 7)
card20 = Card.new(:diamond, "8", 8)
card21 = Card.new(:diamond, "9", 9)
card22 = Card.new(:diamond, "10", 10)
card23 = Card.new(:diamond, "Jack", 11)
card24 = Card.new(:diamond, "Queen", 12)
card25 = Card.new(:diamond, "King", 13)
card26 = Card.new(:diamond, "Ace", 14)
card27 = Card.new(:hearts, "2", 2)
card28 = Card.new(:hearts, "3", 3)
card29 = Card.new(:hearts, "4", 4)
card30 = Card.new(:hearts, "5", 5)
card31 = Card.new(:hearts, "6", 6)
card32 = Card.new(:hearts, "7", 7)
card33 = Card.new(:hearts, "8", 8)
card34 = Card.new(:hearts, "9", 9)
card35 = Card.new(:hearts, "10", 10)
card36 = Card.new(:hearts, "Jack", 11)
card37 = Card.new(:hearts, "Queen", 12)
card38 = Card.new(:hearts, "King", 13)
card39 = Card.new(:hearts, "Ace", 14)
card40 = Card.new(:spades, "2", 2)
card41 = Card.new(:spades, "3", 3)
card42 = Card.new(:spades, "4", 4)
card43 = Card.new(:spades, "5", 5)
card44 = Card.new(:spades, "6", 6)
card45 = Card.new(:spades, "7", 7)
card46 = Card.new(:spades, "8", 8)
card47 = Card.new(:spades, "9", 9)
card48 = Card.new(:spades, "10", 10)
card49 = Card.new(:spades, "Jack", 11)
card50 = Card.new(:spades, "Queen", 12)
card51 = Card.new(:spades, "King", 13)
card52 = Card.new(:spades, "Ace", 14)

playing_cards = [card1, card2, card3, card4, card5, card6, card7,
                card8, card9, card10, card11, card12, card13, card14,
                card15, card16, card17, card18, card19, card20, card21,
                card22, card23, card24, card25, card26, card27, card28,
                card29, card30, card31, card32, card33, card34, card35,
                card36, card37, card38, card39, card40, card41, card42,
                card43, card44, card45, card46, card47, card48, card49,
                card50, card51, card52]

deck1 = Deck.new(playing_cards.sample(26))
deck2 = Deck.new(playing_cards.sample(26))

@player1 = Player.new("Megan", deck1)
@player2 = Player.new("Aurora", deck2)

puts "Welcome to War (or Peace)! This game will be played with 52 cards."
puts "The players today are #{@player1.name} and #{@player2.name}."
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"
print "> "

input = gets.chomp.upcase

if input == "GO"
  game = WeFight.new(@player1, @player2)
  game.start
else
  puts "Please try again."
end
