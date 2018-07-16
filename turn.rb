class Turn
  def initialize(current_player, waiting_player)
    @current_player = current_player
    @waiting_player = waiting_player
    @rand1 = rand(1..20)
    @rand2 = rand(1..20)
    @sum = @rand1 + @rand2
    begin_turn

  end
  def begin_turn
    puts "----- NEW TURN -----"
    ask_question
    receive_input
    check_answer
  end

  def ask_question
    puts "#{@current_player[:name]}: What does #{@rand1} plus #{@rand2} equal?"
  end

  def receive_input
    @input = gets.chomp.to_i
  end

  def check_answer
    if @input == @sum
      puts "YES! You are correct!"
      puts "#{@current_player[:name]} has #{@current_player[:lives]} lives left. #{@waiting_player[:name]} has #{@waiting_player[:lives]} lives left."
    else
      puts "Seriously? No!"
      @current_player[:lives] -= 1
      if @current_player[:lives] == 0
        puts "#{@waiting_player[:name]} wins with a score of #{@waiting_player[:lives]}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
      else
        puts "#{@current_player[:name]} has #{@current_player[:lives]} lives left. #{@waiting_player[:name]} has #{@waiting_player[:lives]} lives left."
      end
    end
  end
end

