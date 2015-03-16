# This module holds the TicTacToe game
module TicTac
  # Create tictactoe, the necessary instance variables, and call the controller
  def TicTac.initialize 
    @win = false
    @stale = false
    @winCases = [ [0, 4, 8], [3, 4, 5], [1, 4, 7], [2, 4, 6], 
                  [0, 1, 2], [0, 3, 6], [6, 7, 8], [2, 5, 8] ]
    
    @grid = (1..9).to_a
    @move_count = 1

    TicTac.controller
  end

  #controls the game until a endstate is found
  def TicTac.controller
    TicTac.draw_board
    until @win
      TicTac.game_play
      TicTac.combo?
      if @win == false and @stale == true
        TicTac.stalemate 
        @win = true
      end
      TicTac.draw_board
    end
  end

  #Instatiates the current boards state
  def TicTac.draw_board
    @grid.each_with_index do |square, index|
      if (index+1) % 3 == 0
        print " #{square} \n"
        print "-----------\n" if index != 8
      else
        print " #{square} |"
      end
    end
  end

  # Controller for player input
  def TicTac.game_play
    if @move_count == 9
      @stale = true
    end

    @move_count % 2 == 0 ? @turn = 'X' : @turn = 'O'
    puts " turn"
    input = gets.chomp.to_i

    if TicTac.valid_move?(input)
      # -1 for 0 index grid
      @turn == 'X'? @grid[input - 1] = 'X' : @grid[input - 1] = 'O'
      @move_count += 1
    else
      return
    end
  end

  # Boolean if move is playable
  def TicTac.valid_move?(input)
    if @grid[input - 1] == 'O' or @grid[input - 1] == 'X'
      TicTac.draw_board
      puts "Invalid move"
      return false  
    end
    true
  end

  # Checks winning combinations
  def TicTac.combo?
    player = nil
    @winCases.each do |a|
      player = @grid[a[0]]
      if (@grid[a[0]] == @grid[a[1]]) && (@grid[a[1]] == @grid[a[2]])
        puts "#{@turn} WON!"
        @win = true
        @stale = false
        return true
      end
    end
    return false
  end

  # Stalemate message
  def TicTac.stalemate
    puts "Game ended in a stalemate."
  end
end

