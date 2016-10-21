require "./lib/card.rb"

RSpec.describe Card do
  let(:card) do
    Card.new("oval", "two", "shaded", "red")
  end

  it "should be an object" do
    expect(card).to be_a(Object)
    expect(card).to be_an_instance_of(Card)
  end

  it "should have the correct shape" do
    expect(card.shape).to eq "oval"
  end

  it "should have the correct number" do
    expect(card.number).to eq "two"
  end

  it "should have the correct fill" do
    expect(card.fill).to eq "shaded"
  end

  it "should have the correct color" do
    expect(card.color).to eq "red"
  end
end
