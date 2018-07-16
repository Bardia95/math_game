require './turn'

class Game
  def initialize
    @player1 = {name: "Player 1", lives: 3}
    @player2 = {name: "Player 2", lives: 3}
    @current_player = @player1
    @waiting_player = @player2
    while @player1[:lives] != 0 && @player2[:lives] != 0 do
      @current_turn = Turn.new(@current_player, @waiting_player)
      if @current_player == @player1
        @current_player = @player2
        @waiting_player = @player1
      else
        @current_player = @player1
        @waiting_player = @player2
      end
    end
  end
end

game1 = Game.new
