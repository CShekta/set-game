require "./lib/card.rb"
require "./lib/deck.rb"

class Game
  def initialize
    @game_over = false
    @all_sets = []
    @hand_size = 12
    @num_cards_in_set = 3
    @deck = Deck.new
    @hand = self.create_hand
  end

  def is_set(card1, card2, card3)
    card1.properties.each_with_index do |property, i|
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
            return [card1, card2, card3]
          end
        end
      end
    end
    return []
  end

  def remove_set_from_hand(set)
    set.each do |card|
      @hand.delete(card)
    end
  end

  def add_to_hand(num_cards)
    new_cards = @deck.draw(num_cards)
    @hand.concat(new_cards)
  end

  def print_set(set)
    set.each do |card|
      puts card
    end
  end

  def print_all_sets
    @all_sets.each do |set|
      self.print_set(set)
      puts ""
    end
  end

  def play_full_game
    while !@game_over
      set = self.find_set
      if !set.empty?
        @all_sets.push(set)
        self.remove_set_from_hand(set)
        if @hand.length < @hand_size && !@deck.empty?
          self.add_to_hand(@num_cards_in_set)
        end
      else
        if @deck.empty?
          @game_over = true
        else
          self.add_to_hand(@num_cards_in_set)
        end
      end
    end
    self.print_all_sets
    puts "You discovered #{@all_sets.length} sets in total"
  end
end
