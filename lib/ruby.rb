require 'colorize'

class Board attr_accessor :board
    
    
    def initialize 
        @white_square = "   ".colorize(background: :white)
        @black_square = "   ".colorize(background: :black)
        self.make_board()
        @knight = Knight.new()

        
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

    end 


    end 


    def show_board
        @temp = @board
        @board = @board.map {|array| array.join("")}
        puts @board
        puts "\n"
        @board = @temp
        
    end 

    def clear_board()
        make_board()
        colour_board()
        show_board()
    end 

    def move_knight(y, x)
        

        if @board[x][y] == @black_square
            @knight.piece = @knight.string.encode("utf-8").light_black
            @board[x][y] = @knight.piece.colorize(background: :black)
        elsif @board[x][y] == @white_square
            @knight.piece = @knight.string.encode("utf-8").light_white
            @board[x][y] = @knight.piece.colorize(background: :white)
        end 

    end 

end 

class Knight

    attr_accessor :piece, :string

    def initialize
        @string = " \u265E " 
        @piece =  @string.encode("utf-8").light_white
    end 


end

board = Board.new()
board.colour_board()
# board.show_board()
knight = Knight.new()
board.move_knight(2,7)
puts "\n"
board.show_board()
board.clear_board()
board.move_knight(3,1)
puts "\n"

board.show_board()


#pseudocode

# knight has 8 possible moves 
#1 node has starting node(data?), option_1 .. option_5
#e.g #move_1 = 0,0, possible next options = each of 5 options 
# singly directed graph
#possible next moves = 5 children each 
# knight can move 2 steps forward /back (y - 2 ) or (y+2) 
#and one step right/ left (x+1) or (y+1)
# use breadth first search - depth first search could be infinite 
# basically find depth of each node and return shortest depth 
#print series of moves 
#leave a trail (change colour at each of the coordinates)
#clear board 
# show knight at final coordinates
