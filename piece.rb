class Piece

  STRAIGHT_DELTAS = [[1,0], [0,1], [-1,0], [0,-1]]
  DIAGONAL_DELTAS = [[1,1], [-1,-1], [1, -1], [-1,1]]

  attr_reader :color
  attr_accessor :pos, :board, :moved

  def initialize(board, pos, color)
    @board, @pos, @color = board, pos, color
    @moved = false
  end

  def moves
    raise "Didn't implement moves function."
  end

  def off_board?(pos)
    !pos.all? { |num| num.between?(0, Board::BOARD_SIZE - 1) }
  end

  def move_into_check?(end_pos)
    dup_board = @board.dup
    dup_board.move!(@pos,end_pos)
    dup_board.in_check?(@color)
  end

  def valid_moves
    self.moves.reject { |move| move_into_check?(move) }
  end

  def has_moved?
    @moved
  end

  def special_moves
    []
  end

end


class Array
  def add_delta(delta)
    [self[0] + delta[0], self[1] + delta[1]]
  end

  def remove_delta(delta)
    [self[0] - delta[0], self[1] - delta[1]]
  end
end
