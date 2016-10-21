require "./lib/game.rb"

RSpec.describe Card do
  let(:game) do
    Game.new
  end
  let(:card1) do
    Card.new("oval", "one", "shaded", "green")
  end
  let(:card2) do
    Card.new("oval", "two", "shaded", "red")
  end
  let(:card3) do
    Card.new("oval", "three", "shaded", "purple")
  end
  let(:card4) do
    Card.new("squiggle", "two", "open", "red")
  end
  let(:card5) do
    Card.new("diamond", "one", "solid", "green")
  end


  it "should be an object" do
    expect(game).to be_a(Object)
    expect(game).to be_an_instance_of(Game)
  end

  it "should determine a set" do
    expect(game.is_set(card1, card2, card3)).to be true
    expect(game.is_set(card3, card4, card5)).to be true
    expect(game.is_set(card1, card2, card5)).to be false
  end

  it "should puts at the end of the game" do
    expect do
      game.play_full_game
    end.to output().to_stdout
  end

end
