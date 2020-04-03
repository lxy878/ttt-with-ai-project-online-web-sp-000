module Players
  class Computer < Player
    def move(board)
      valid_move = board.cells.index(" ") + 1
      valid_move.to_s
    end
  end
end
