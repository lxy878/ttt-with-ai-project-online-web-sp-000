module Players
  class Computer < Player
    def move(board)
      board.cells.index(" ") + 1
    end
  end
end
