require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    count_x = 0
    count_o = 0
    @board.cells.each do |cell|
      if cell == 'X'
        count_x += 1
      elsif cell == "O"
        count_o += 1
      end
    end
    count_x > count_o ? @player_2 : @player_1
  end

  def won?
    @won = false
    WIN_COMBINATIONS.each do |combo|
      c0 = combo[0]
      c1 = combo[1]
      c2 = combo[2]
      if (@board.cells[c0] == "X" and @board.cells[c1] == "X" and @board.cells[c2] == "X") or (@board.cells[c0] == "O" and @board.cells[c1] == "O" and @board.cells[c2] == "O")
        @won = combo
        break
      end
    end
    @won
  end

  def draw?
    won?.class != Array and @board.full?
  end

  def over?
    draw? or @won.class == Array
  end

  def winner
    won?.class!=Array ? nil : @board.cells[@won[0]]
  end

  def turn
    index = current_player.move(@board)
    if !@board.valid_move?(index)
      # binding.pry
      turn
    end
    @board.update(index, current_player)
  end

  def play
    # turn
    # binding.pry
    while !over?
      turn
      if won?
        break
      end
    end
    won_player = winner
    if won_player.nil?
      puts "Cat\'s Game!"
    else
      puts  "Congratulations #{won_player}!"
    end
  end

end
