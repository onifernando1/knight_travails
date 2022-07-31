require 'colorize'


class Board
    def initialize 
        @board = Array.new(8,Array.new(8," "))
    end 

    def show_board
        p @board
    end 



end 

class Knight

    attr_accessor :piece

    def initialize 
        @string = "\u2658"
        @piece =  @string.encode("utf-8")
    end 

end

knight = Knight.new()
puts knight.piece
board = Board.new()
board.show_board()
puts "Hello".blue