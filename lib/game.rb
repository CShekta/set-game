require "./lib/card.rb"
require "./lib/deck.rb"

class Game
  def initialize
    @all_sets = []
    @hand_size = 12
    @num_cards_in_set = 3
    @deck = Deck.new
    @hand = self.create_hand
    i, j, k = self.find_set
    puts @hand[i]
    puts @hand[j]
    puts @hand[k]
  end

  def is_set(card1, card2, card3)
    card1.properties.each_with_index do |property, i|
      puts "property = #{property} #{card2.properties[i]} #{card3.properties[i]}"
      if property == card2.properties[i]
        if property != card3.properties[i]
          return false
        end
      else
        if property == card3.properties[i] || card2.properties[i] == card3.properties[i]
          return false
        end
      end
    end
    return true
  end

  def create_hand
    return @deck.draw(@hand_size)
  end

  def find_set
    @hand.each_with_index do |card1, i|
      @hand[i+1..-1].each_with_index do |card2, j|
        @hand[j+1..-1].each_with_index do |card3, k|
          if is_set(card1, card2, card3)
            puts card1
            puts card2
            puts card3
            return i, j+i+1, k+i+j+1
          end
        end
      end
    end
    return nil
  end

  def store_set(index1, index2, index3)
    indices = [index1, index2, index3]
    set = []
    indices.each do |index|
      set.push(@hand[index])
    end
    @all_sets.push(set)
  end

  def remove_set(set)
    set.each do |card|
      @hand.delete(card)
    end
  end

  def add_to_hand(num_cards)
    new_cards = @deck.draw(num_cards)
    @hand.push(new_cards)
  end

  def play_full_game



  end

end
