module Players
  class Computer < Player
    def move(board)
      board.find_index(" ")
    end
  end
end
