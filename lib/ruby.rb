class Board

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
