require "./tictactoe"
require "./mastermind"
# This module holds general items for command line games
module Games

  class Player
    attr_accessor :name
    def initialize(name)
      @name = name.downcase
    end
  end

  #This class is the general game object
  class Game
    def initialize
      puts "Play tictactoe or mastermind?"
      @input = gets.chomp.downcase

      self.games
    end

    def games
      if @input == "tictactoe"
        @p1 = Player.new("Player 1")
        @p2 = Player.new("Player 2")
        TicTac.initialize
      elsif @input == "mastermind"
        @p1 = Player.new("Player 1")
        Mastermind.initialize 
      else
        exit
      end
    end
  end
end

g = Games::Game.new
