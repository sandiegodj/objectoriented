
# AI not quite done
module Mastermind

	def Mastermind.initialize
		@p = %w(A B C D E F)
		@code = []
		@win = false
		@turn = 1
		Mastermind.router
	end

	def Mastermind.router
		puts "Press 1 to be the Guesser, 2 to be the creator."
		input = gets.chomp
		if input == "1"
			Mastermind.controller
		else
			Mastermind.ai_controller
		end
	end

	def Mastermind.controller
		Mastermind.generate_code

		while @win == false
			Mastermind.user_guess
			Mastermind.check_guess
			if @turn > 10
				puts "Game Over!"
				Mastermind.replay?
			end
		end
		puts "Congrats, you won!"
		Mastermind.replay?
	end

	def Mastermind.ai_controller
		Mastermind.user_generate_code
		@guess = [nil, nil, nil, nil]
		while @win == false
			Mastermind.ai_check_guess
			if @turn > 10
				puts "You beat the computer!"
				Mastermind.replay?
			end
		end
		puts "The computer got it."
	end

	def Mastermind.user_generate_code
		puts "Please choose a 4 character code using A - F"
		@code = gets.chomp.upcase.split('')
		unless Mastermind.good_input?(@code)
			puts "Sorry, that's an invalid code"
			Mastermind.user_generate_code
		end
	end

	def Mastermind.generate_code
		4.times do
			@code << @p[rand(0..@p.length - 1)]
		end
	end

	def Mastermind.user_guess
		puts "Enter guess:"
		@guess = gets.chomp.upcase.split('')

		unless Mastermind.good_input?(@guess)
			puts "Sorry, that's an invalid guess."
			Mastermind.user_guess
		end
	end

	def Mastermind.good_input?(input)
		if input.length != 4
			return false
		end
		input.each do |i|
			unless @p.include?(i)
				return false
			end
		end
	end

	def Mastermind.check_guess
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

	def Mastermind.ai_check_guess
		@code_temp == @code.dup

		@code_temp.each_with_index do |c, i|
			if @guess[i] == nil
				#run pattern to find.
			end
		end

	end


	def Mastermind.replay?
		puts "play again? y/n"
		input = gets.chomp.downcase
		if input == 'y'
			Mastermind.initialize
		end
		exit
	end
end
