require 'colorize'
#current board logic 
# make grid 1..100
# odd numbers replace with white square
# even numbers replace with black square
# join together 
# print 

class Board attr_accessor :board
    
    
    def initialize 
        @white_square = "  ".colorize(background: :blue)
        @black_square = "  ".colorize(background: :red)
        
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
        
        @board.each_with_index do |item, index|
        if index == 0 || index == 2 || index == 4 || index == 6
            for i in odd 
            p @board[index][i] = @white_square
            end 
        end 

        if index == 0 || index == 2 || index == 4 || index == 6
            for i in even 
            p @board[index][i] = @black_square
            end 
        end 

        if index == 1 || index == 3 || index == 5 || index == 7
            for i in odd 
            p @board[index][i] = @black_square
            end 
        end 

        if index == 1 || index == 3 || index == 5 || index == 7
            for i in even 
            p @board[index][i] = @white_square
            end 
        end 

        p @board
    end 


    end 


    def show_board
        @board = @board.map {|array| array.join("")}
        puts @board 
    end 



end 

# class Knight

#     attr_accessor :piece

#     def initialize 
#         @string = "\u2658"
#         @piece =  @string.encode("utf-8")
#     end 

# end

# knight = Knight.new()
board = Board.new()
board.make_board()
board.colour_board()
board.show_board()