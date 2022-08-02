require 'colorize'
require 'matrix'

class Board attr_accessor :board
    
    
    def initialize(path)
        @white_square = "   ".colorize(background: :white)
        @black_square = "   ".colorize(background: :black)
        make_board()
        @knight = Knight.new()
        @path = path

        
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


    def move_knight(y, x)
        
        x = 7 - x

        if @board[x][y] == @black_square
            @knight.piece = @knight.string.encode("utf-8").light_black
            @board[x][y] = @knight.piece.colorize(background: :black)
        elsif @board[x][y] == @white_square
            @knight.piece = @knight.string.encode("utf-8").light_black
            @board[x][y] = @knight.piece.colorize(background: :white)
        end 

    end 

    def change_colour_of_square(y, x)

        @board[x][y] = "   ".colorize(background: :light_red)

    end 

    def highlight_path

        # start
        x = @path[0][0]
        y = @path[0][1]
        move_knight(x,y)
        show_board()




        # middle 
        rest_of_path =  @path[1...-1]
        rest_of_path.each do |co|
            x = co[0]
            y = 7 - co[1]
            change_colour_of_square(x,y)
            show_board()


        end 


        # end 
        x = @path[-1][0]
        y = @path[-1][1]
        move_knight(x,y)
        show_board()

    end 

    def start
        make_board()
        colour_board()
    end 

end 

class Knight

    attr_accessor :piece, :string

    def initialize
        @string = " \u265E " 
        @piece =  @string.encode("utf-8").light_white
    end 

    def possible_moves(xx, yy)

        #possible moves of knight 

        x_coordinates = [+2, +2, -2, -2, +1, +1, -1, -1]
        y_coordinates = [+1, -1, +1, -1, +2, -2, +2, -2]

        for i in (0..7)
            x = xx + x_coordinates[i]
            y = yy + y_coordinates[i]
            puts "#{x},#{y}"
        end 

    end
    
  

end

class Node attr_accessor :x, :y, :distance, :co_ordinates, :parent

    def initialize(x=nil, y=nil, distance=0, parent=nil)
        @x = x
        @y =y  
        @co_ordinates = [x,y]
        @distance = distance
        @parent = parent
    end 


end 

class Tree attr_accessor :queue, :moves, :path, :continue

    def initialize 
        @queue = []
        @moves = []
        @path = []
        @continue = true 
    end 

    def add_node(x, y, distance, parent=nil)
        node = Node.new(x, y, distance, parent)
        @queue << node 
        node
    end 

    def move_valid? (x, y)

        if x < 8 && x > 0 && y < 8 && y > 0 
            return true 
        else 
            return false 
        end 

    end 

    def min_steps(x_start, y_start, x_end, y_end)

        #check if in board



        unless move_valid?(x_start, y_start) && move_valid?(x_end, y_end)
            puts "OUTSIDE OF BOARD"
            @continue = false 
            return 
        end 

   
        #possible moves of knight 

        x_coordinates = [+2, +2, -2, -2, +1, +1, -1, -1]
        y_coordinates = [+1, -1, +1, -1, +2, -2, +2, -2]



        #matrix to track visited spaces

        matrix = [
                    [false,false,false,false,false,false,false,false],
                    [false,false,false,false,false,false,false,false],
                    [false,false,false,false,false,false,false,false],
                    [false,false,false,false,false,false,false,false],
                    [false,false,false,false,false,false,false,false],
                    [false,false,false,false,false,false,false,false],
                    [false,false,false,false,false,false,false,false],
                    [false,false,false,false,false,false,false,false]
        ]

        visited = matrix


        # root = add_node(x_start, y_start, 0)
         #pointer
         @current_node = add_node(x_start, y_start, 0) 
         node_number = 0
  
        #set start root node to visited 
        visited[x_start][y_start] = true 

       
        
        until @current_node.x == x_end && @current_node.y == y_end 
            

            #go through possible moves 

            for i in (0..7)

                x = @current_node.x + x_coordinates[i]
                y = @current_node.y + y_coordinates[i]

                if move_valid?(x,y) && visited[x][y] == false 
                    visited[x][y] = true 
                    @moves << add_node(x,y,@current_node.distance + 1, @current_node )
                end
                

            end 

            #move to next node in @nodes
                node_number += 1 
                @current_node = @queue[node_number]
                # visited = matrix
                

        end 
        visited = matrix


    
    end 

    def print_path


        current = @current_node

        puts "You made it in #{@current_node.distance} moves"

        for i in (0..@current_node.distance)
            @path.prepend(current.co_ordinates)
            current = current.parent
        end 

        p @path

    end 



    
end 

knight = Knight.new()
tree = Tree.new()

# change the coordinates below 
starting_x = 5
starting_y = 8
ending_x = 6
ending_y = 6

##

tree.add_node(starting_x,starting_y,0)
tree.min_steps(starting_x,starting_y,ending_x,ending_y)

if tree.continue == true 

    board = Board.new(tree.path)
    board.start()
    tree.print_path()
    board.highlight_path()

else 
    puts "Sorry, try co-ordinates from 0-7!"
end 