require "./deck"
require "./card"
require "./player"
require "pry"

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :discard_pile

  def initialize(player1, player2)
    @player1        = player1
    @player2        = player2
    @spoils_of_war  = []
    @discard_pile   = []
  end

  def type
      if @player1.deck.rank_of_card_at(0)  == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        :war
      elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        :basic
      end
  end

  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end
    elsif type == :mutually_assured_destruction
      "No winner"
    else
      "Draw"
    end
  end

  def pile_cards
    if type == :mutually_assured_destruction
      3.times do
        @discard_pile << @player1.deck.remove_card
        @discard_pile << @player2.deck.remove_card
      end
    elsif type == :war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
    elsif type == :basic
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
    else
    end
  end

  def award_spoils(winner)
    if winner == @player1 || winner == @player2
      @spoils_of_war.each do |win|
        winner.deck.cards << win
      end
    else
    end
    @spoils_of_war.clear
  end
end
