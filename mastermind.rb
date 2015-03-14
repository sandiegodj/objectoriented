require './gamecontroller'


module Mastermind

	def Mastermind.initialize
		@p = %w(A B C D E F)
		@code = []
		@win = false
		Mastermind.controller
	end

	def Mastermind.controller
		Mastermind.generate_code

		while @win == false
			Mastermind.user_guess
			Mastermind.check_guess
		end
		puts "Congrats, you won!"
		puts "play again? y/n"
		input = gets.chomp.downcase
		if input == 'y'
			Mastermind.initialize
		end
	end

	def Mastermind.generate_code
		4.times do
			@code << @p[rand(0..@p.length - 1)]
		end
		puts @code
	end

	def Mastermind.user_guess
		puts "Enter guess:"
		@guess = gets.chomp.upcase.split('')

		unless Mastermind.good_guess?
			puts "Sorry, that's an invalid guess."
			Mastermind.user_guess
		end
	end

	def Mastermind.good_guess?
		if @guess.length != 4
			return false
		end
		@guess.each do |i|
			unless @p.include?(i)
				return false
			end
		end
	end

	def Mastermind.check_guess
		@feedback = [0,0]
		@temp = @guess

		@code.each_with_index do |c, i|
			if c == @temp[i]
				@feedback[0] += 1
				@temp[i] = nil
			end
		end

		if @feedback[0] == 4
			@win = true
		end

		@temp.each do |i|
			if @code.include?(i)
				@feedback[1] += 1
			end
		end
		puts @feedback.join(',')
	end

end

g = Games::Game.new
g.games("mastermind")