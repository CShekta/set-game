require "./lib/deck.rb"

RSpec.describe Deck do
  let(:deck) do
    Deck.new
  end

  it "should be an object" do
    expect(deck).to be_a(Object)
    expect(deck).to be_an_instance_of(Deck)
  end

  it "should have 81 cards upon creation" do
    expect(deck.draw(81).length).to eq 81
    expect(deck.draw(1).length).to eq 0
  end

  it "should remove cards from deck by drawing" do
    expect(deck.draw(2).length).to eq 2
  end
end
