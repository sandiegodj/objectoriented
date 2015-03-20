require "./tictactoe"
require "./mastermind"
# This module holds general items for command line games
module Games

  # This class is a player object
  class Player
    attr_accessor :name


    # Create the player and store their name
    def initialize(name)
      @name = name.downcase
    end
  end

  #This class is the general game object
  class Game

    #Create a new game and initialize the player
    def initialize
      puts "1. tictactoe \n 2. mastermind? (type number)" 
      @input = gets.chomp.downcase

      self.games
    end

    # Decide which game to play
    def games
      if @input == "1"
        @p1 = Player.new("Player 1")
        @p2 = Player.new("Player 2")
        TicTac.initialize
      elsif @input == "2"
        @p1 = Player.new("Player 1")
        Mastermind.initialize 
      else
        exit
      end
    end
  end
end

g = Games::Game.new
