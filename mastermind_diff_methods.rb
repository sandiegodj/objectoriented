require './gamecontroller'


module Mastermind

	def initialize
		@p = %w(A B C D E F)
		@code = []
		@win = false
		@turn = 1
		router
	end

	def router
		puts "Press 1 to be the Guesser, 2 to be the creator."
		input = gets.chomp
		if input == "1"
			controller
		else
			ai_controller
		end
	end

	def controller
		generate_code

		while @win == false
			user_guess
			check_guess
			if @turn > 7
				puts "Game Over!"
				replay?
			end
		end
		puts "Congrats, you won!"
		replay?
	end

	def ai_controller
		user_generate_code
		while @win == false
			ai_check_guess
		end
		puts "The computer guess in"
	end

	def user_generate_code
		puts "Please choose a 4 character code using A - F"
		@code = gets.chomp.upcase.split('')
		unless good_input?(@code)
			puts "Sorry, that's an invalid code"
			user_generate_code
		end
	end

	def generate_code
		4.times do
			@code << @p[rand(0..@p.length - 1)]
		end
		puts @code
	end

	def user_guess
		puts "Enter guess:"
		@guess = gets.chomp.upcase.split('')

		unless good_input?(@guess)
			puts "Sorry, that's an invalid guess."
			user_guess
		end
	end

	def good_input?(input)
		if input.length != 4
			return false
		end
		input.each do |i|
			unless @p.include?(i)
				return false
			end
		end
	end

	def check_guess
		@guess_temp = @guess
		@code_temp = @code.dup
		@feedback = [0,0]

		@code_temp.each_with_index do |c, i|
			if c == @guess_temp[i]
				@feedback[0] += 1
				@guess_temp[i] = nil
				@code_temp[i] = 0
			end
		end
	
		if @feedback[0] == 4
			@win = true
		end

		@guess_temp.each do |i|
			if @code_temp.include?(i)
				@feedback[1] += 1
			end
		end
		@turn +=1
		puts @feedback.join(',')
	end

	def ai_check_guess

	end


	def replay?
		puts "play again? y/n"
		input = gets.chomp.downcase
		if input == 'y'
			initialize
		end
		exit
	end

end

g = Games::Game.new
g.games("mastermind")