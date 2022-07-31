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

        p @board

        @board[0][1] = "z"
         
        p @board
    end 


#     def colour_board

#         odd = [1,3,5,7]
#         even = [0,2,4,6]
#         y = ["a","a","a","a","a","a","a","a"]
#         @board = @board.map do |item|
#             if item == "a"
#                 item = y
#             end 
#         end  

#         @board[0][1] = "z"
#         p @board 

#     end 


#     def show_board
#         @board = @board.map {|array| array.join("")}
#         puts @board 
#     end 



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
# board.colour_board()

# rows = 8 
# columns = 8

# board = Array.new(rows) do
#     Array.new(columns) { "a" }
#   end

#   p board 

#   board[0][1] = "a"

#   p board