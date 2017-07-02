class HumanPlayer
  attr_accessor :board, :name, :mark

  def initialize(name)
    @name = name
  end

  def get_move
    p "Where would you like to move? (in the form 0, 0)"
    move = gets.chomp
    pos = move.split(",").map(&:to_i) 
  end

  def display(board)
    print "-" * board.grid.length * 12
    puts ""
    board.grid.each do |row|
      row.each do |pos|
        if !pos.nil?
          print " | #{pos} | "
        else
          print " |   | "
        end
      end
      print "\n"
    end
  end

end
