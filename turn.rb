class Turn
  def initialize(current_player, waiting_player)
    @current_player = current_player
    @waiting_player = waiting_player
    generate_random
    begin_turn
    ask_question
    receive_input
    check_answer
  end

  def generate_random
    @rand1 = rand(1..20)
    @rand2 = rand(1..20)
    @sum = @rand1 + @rand2
  end

  def begin_turn
    puts "----- NEW TURN -----"
  end

  def ask_question
    puts "#{@current_player[:name]}: What does #{@rand1} plus #{@rand2} equal?"
  end

  def receive_input
    @input = gets.chomp.to_i
  end

  def correct_answer
    puts "YES! You are correct!"
    puts "#{@current_player[:name]} has #{@current_player[:lives]} lives left. #{@waiting_player[:name]} has #{@waiting_player[:lives]} lives left."
  end

  def incorrect_answer
    puts "Seriously? No!"
    @current_player[:lives] -= 1
  end

  def game_over
    puts "#{@waiting_player[:name]} wins with a score of #{@waiting_player[:lives]}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def game_state
    puts "#{@current_player[:name]} has #{@current_player[:lives]} lives left. #{@waiting_player[:name]} has #{@waiting_player[:lives]} lives left."
  end

  def check_answer
    if @input == @sum
      correct_answer
     else
      incorrect_answer
      if @current_player[:lives] == 0
        game_over
      else
        game_state
      end
    end
  end
end

