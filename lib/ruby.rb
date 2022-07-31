require 'colorize'
#current board logic 
# make grid 1..100
# odd numbers replace with white square
# even numbers replace with black square
# join together 
# print 

class Board
    def initialize 
        @white_square = "  ".colorize(background: :blue)
        @black_square = "  ".colorize(background: :red)

        @board = Array.new(8, Array.new(8,nil))
    end 

    def colour_board

        odd = [1,3,5,7]
        even = [0,2,4,6]

        @board.each_with_index do |data, index|
            puts "Index #{index}"
            puts "Data #{data}"
            if index == 0 || index == 2 || index == 4 || index == 6 
                for i in odd 
                    @board[index][i] = @white_square
                end 
                for i in even 
                    @board[index][i] = @black_square
                end 
            end 
            if index == 1 || index == 3 || index == 5 || index == 7 
                for i in even 
                    @board[index][i] = @white_square
                end 
                for i in odd 
                    @board[index][i] = @black_square
                end 
            end 
        end 

        @board

    end 


    def show_board
        @board = @board.map {|array| array.join("")}
        puts @board 
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
# puts knight.piece
# board = Board.new()
# board.show_board()
# puts "Hello".blue
# puts "  ".colorize(background: :blue)




# array = Array.new(8, Array.new(8, "O"))
# array.each do |item|
#     new_array = item.flatten
#     puts new_array 
# end 
 

# array = [[1, 2, 3, 4],[1,2,3,4],[1,2,3,4]]
# a = [1, 2, 3 , 4]
# a = a.join()
# puts a 

# puts array.map {|item| item.join("")}
board = Board.new()
board.colour_board()

