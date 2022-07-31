require 'colorize'

class Board attr_accessor :board
    
    
    def initialize 
        @white_square = "   ".colorize(background: :white)
        @black_square = "   ".colorize(background: :black)
        self.make_board()
        
    end 

    def make_board

        rows = 8 
        columns = 8

        @board = Array.new(rows) do
            Array.new(columns) { "a" }
        end
    end 


    def colour_board

        odd = [1,3,5,7]
        even = [0,2,4,6]
        
        @board.each_index do |index|
        if index == 0 || index == 2 || index == 4 || index == 6
            for i in odd 
            @board[index][i] = @black_square
            end 
        end 

        if index == 0 || index == 2 || index == 4 || index == 6
            for i in even 
            @board[index][i] = @white_square
            end 
        end 

        if index == 1 || index == 3 || index == 5 || index == 7
            for i in odd 
            @board[index][i] = @white_square
            end 
        end 

        if index == 1 || index == 3 || index == 5 || index == 7
            for i in even 
            @board[index][i] = @black_square
            end 
        end 


        @string = " \u265E " 
        @piece =  @string.encode("utf-8") 

        @board[7][1] = @piece.colorize(background: :yellow)


    end 


    end 


    def show_board
        @board = @board.map {|array| array.join("")}
        puts @board 
    end 

    def practice
    
    end 

end 

class Knight

    attr_accessor :piece

    def initialize 
        @string = "\u2658"
        @piece =  @string.encode("utf-8")
    end 

    def move(y, x)

    end 

    def practice

    end 

end

board = Board.new()
board.colour_board()
board.show_board()
knight = Knight.new()
board.practice()