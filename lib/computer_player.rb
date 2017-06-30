class ComputerPlayer
attr_reader :board, :name
attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def win?(pos)
    board[pos] = mark
    if mark == board.winner
      board[pos] = nil
      return true
    else
      board[pos] = nil
      return false
    end
  end

  def get_move
    available_pos = []
    (0...board.grid.length).each do |row|
      (0...board.grid.length).each do |column|
        position = [row, column]
        available_pos << position if board[position].nil?
        end
      end

    available_pos.each do |pos|
      return pos if win?(pos)
    end

    random_num = rand(0...available_pos.length)
    available_pos[random_num]
  end

end
