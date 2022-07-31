class Board
    def initialize 
    end 

    def make_board
        board = Array.new(8,Array.new(8," "))
        p board
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
board.make_board
