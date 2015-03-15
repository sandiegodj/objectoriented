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
      @p1 = Player.new("Player 1")
      @p2 = Player.new("Player 2")
    end

    # Decide which game to play
    def games(game)
      TicTac.initialize if game == "tictactoe"
      Mastermind::initialize if game == "mastermind"
    end
  end
end