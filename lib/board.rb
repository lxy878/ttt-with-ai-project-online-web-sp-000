require "pry"

class Board
  attr_accessor :cells
  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(index)
      @cells[index.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
     @cells.find_all{|i| i != " "}.size
  end

  def taken?(index)
    position = index.to_i - 1
    @cells[position].nil? or @cells[position] != " "
  end

  def valid_move?(index)
    index.to_i >0 and !taken?(index)
  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
    player
  end

end
