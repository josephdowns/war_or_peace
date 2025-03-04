require "rspec"
require "./lib/card"
require "./lib/deck"
require "./lib/player"

describe Player do
  it "is a player" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new("Clarisa", deck)

    expect(player).to be_an_instance_of(Player)
    expect(player.name).to eq("Clarisa")
    expect(player.deck).to eq(deck)
    expect(player.has_lost?).to eq(false)
    expect(player.deck.remove_card).to eq(card1)
    expect(player.has_lost?).to eq(false)
    expect(player.deck.remove_card).to eq(card2)
    expect(player.has_lost?).to eq(false)
    expect(player.deck.remove_card).to eq(card3)
    expect(player.has_lost?).to eq(true)
    
  end
end
