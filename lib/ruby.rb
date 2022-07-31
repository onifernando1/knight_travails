# frozen_string_literal: true

require 'colorize'

class Board
  def initialize
    @white_square = '  '.colorize(background: :white)
    @black_square = '  '.colorize(background: :black)
    make_board
  end

  def make_board
    rows = 8
    columns = 8

    @board = Array.new(rows) do
      Array.new(columns) { 'a' }
    end
  end

  def colour_board
    odd = [1, 3, 5, 7]
    even = [0, 2, 4, 6]

    @board.each_with_index do |_item, index|
      if [0, 2, 4, 6].include?(index)
        odd.each do |i|
          @board[index][i] = @black_square
        end
      end

      if [0, 2, 4, 6].include?(index)
        even.each do |i|
          @board[index][i] = @white_square
        end
      end

      if [1, 3, 5, 7].include?(index)
        odd.each do |i|
          @board[index][i] = @white_square
        end
      end

      next unless [1, 3, 5, 7].include?(index)

      even.each do |i|
        @board[index][i] = @black_square
      end
    end
  end

  def show_board
    @board = @board.map { |array| array.join('') }
    puts @board
  end
end

class Knight
  attr_accessor :piece

  def initialize
    @string = "\u2658"
    @piece = @string.encode('utf-8')
  end
end

board = Board.new
board.colour_board
board.show_board
