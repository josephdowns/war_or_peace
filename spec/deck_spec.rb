require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck).to be_an_instance_of(Deck)
    expect(deck.cards).to eq(cards)
    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
    expect(deck.cards).to eq(cards)
    expect(deck.high_ranking_cards).to eq([card1, card3])
    expect(deck.percent_high_ranking).to eq(66.67)
    expect(deck.remove_card).to eq(card1)
    expect(deck.cards).to eq([card2, card3])
    expect(deck.high_ranking_cards).to eq([card3])
    expect(deck.percent_high_ranking).to eq(50.00)

    card4 = Card.new(:club, "5", 5)

    expect(deck.add_card(card4)).to eq([card2, card3, card4])
    expect(deck.cards).to eq([card2, card3, card4])
    expect(deck.high_ranking_cards).to eq([card3])
    expect(deck.percent_high_ranking).to eq(33.33)
  end

end
