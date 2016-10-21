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
    expect(deck.length).to eq 81
  end

  it "should remove cards when drawn" do
    expect(deck.length).to eq 78
  end
  #
  # it "should have the correct fill" do
  #   expect(deck.fill).to eq "shaded"
  # end
  #
  # it "should have the correct color" do
  #   expect(deck.color).to eq "red"
  # end
end
