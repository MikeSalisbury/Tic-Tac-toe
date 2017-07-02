require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
attr_reader :player_one, :player_two, :current_player
attr_accessor :mark, :board

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    player_one.mark = :X
    player_two.mark = :O
    @board = Board.new
    @current_player = @player_one
  end

  def play
    until board.over?
      play_turn
    end
    if board.winner
      p "#{current_player.name} is the winner!"
      @current_player.display(board)
    else
      p "Cats game - It's a tie!"
    end
  end

  def play_turn
      @current_player.display(board)
      move = @current_player.get_move
        #if board.empty?(move)
          board.place_mark(move, @current_player.mark)
          switch_players! if !@board.winner
        # else
        #   p "Please choose an available position"
        #   play_turn
        # end

      # if @current_player == player_one
      #   @current_player.display(board)
      #   move = @current_player.get_move
      #   board.place_mark(move, player_one.mark)
      # else
      #   move = @current_player.get_move
      #   board.place_mark(move, player_two.mark)
      #   @current.display(board)
      # end
  end

  def switch_players!
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
    @current_player
  end

end

if $0 == __FILE__
  puts "Welcome to TicTacToe!"
  print "Please enter your name: "
  player1 = HumanPlayer.new(gets.chomp)
  print "Please enter your computers name: "
  player2 = ComputerPlayer.new(gets.chomp)
  game = Game.new(player1, player2)
  game.play
end
