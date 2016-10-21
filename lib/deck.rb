require "./lib/card.rb"

class Deck

  def initialize
    @shapes = ["oval", "squiggle", "diamond" ]
    @numbers = ["one", "two", "three"]
    @fills = ["solid", "striped", "open"]
    @colors = ["red", "green", "purple"]
    @deck = self.generate_deck
  end

  def generate_deck
    deck = []
    @shapes.each do |shape|
      @numbers.each do |number|
        @fills.each do |fill|
          @colors.each do |color|
            deck.push(Card.new(shape, number, fill, color))
          end
        end
      end
    end
    deck = deck.shuffle
    return deck
  end

  def empty?
    return @deck.empty?
  end

  def draw(size)
    return @deck.pop(size)
  end
end
