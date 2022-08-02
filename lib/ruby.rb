require 'colorize'
require 'matrix'

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

class Node attr_accessor :x, :y, :distance, :co_ordinates

    def initialize(x=nil, y=nil, distance=0)
        @x = x
        @y =y  
        @co_ordinates = [x,y]
        @distance = distance
    end 


end 

class Tree attr_accessor :queue, :moves

    def initialize 
        @nodes = []
        @moves = []
    end 

    def add_node(x, y, distance)
        node = Node.new(x, y, distance)
        @nodes << node 
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

        # unless move_valid?(x_start, y_start) && move_valid?(x_end, y_end)
        #     puts "OUTSIDE OF BOARD"
        # end 

   
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
         current_node = add_node(x_start, y_start, 0) 
         node_number = 0
  
         #end goal reached?
  
         end_goal = false 

        #set start root node to visited 
        visited[x_start][y_start] = true 

       

        
        until end_goal == true 
            

             #Return when reached destination
            
            if current_node.x == x_end && current_node.y == y_end 
                p current_node
                p current_node.distance
                p "DONE"
                visited = matrix
                end_goal = true 
                return 
            end 

            #go through possible moves 

            for i in (0..7)

                puts i 
                x = current_node.x + x_coordinates[i]
                y = current_node.y + y_coordinates[i]

                if move_valid?(x,y) && visited[x][y] == false 
                    # puts "#{x},#{y}"
                    visited[x][y] = true 
                    new_nodes = add_node(x,y,current_node.distance + 1 )
                    @moves << new_nodes.co_ordinates
                    new_nodes
                end
                

            end 

            #move to next node in @nodes
                node_number += 1 
                if @nodes[node_number] == nil
                    return 
                end 
                current_node = @nodes[node_number]
                p current_node 
                p "Above node is current node"
                visited = matrix
                

        end 


    
    end 

    def track_moves

        p @moves

        # @ordered_moves = []

        # reversed = @moves.reverse

        # p reversed

        # max_moves = reversed[0].distance



        # @ordered_moves.unshift(reversed[0]) 

        # p @ordered_moves


    end 


    
end 


knight = Knight.new()
tree = Tree.new()
tree.add_node(3,3,0)
tree.min_steps(3,3,4,3)
tree.track_moves()














# class Node attr_accessor :x, :y, :m1, :m2, :m3, :m4, :m5, :m6, :m7, :m8

#     def initialize(x=2, y=7)
#         @x = x 
#         @y = y
#         @m1 = nil
#         @m2 = nil
#         @m3 = nil
#         @m4 = nil 
#         @m5 = nil 
#         @m6 = nil
#         @m7 = nil
#         @m8 = nil
#     end 


# end 

# class Tree

#     def build_tree(node) # stack level too deep 

#         #base case 

#             if node.x > 7 || node.y > 7 || node.x < 0 || node.y < 0
#                 return 
#             end

#         until node.x == 5 && node.y == 7


#         # right two, one up or down 
#             node.m1 = build_tree(Node.new(node.x + 2, node.y + 1))
#         end 
#         # node.m2 = build_tree(Node.new(node.x + 2, node.y - 1))

#         # # # up two, one left or right 

#         # node.m3 = build_tree(Node.new(node.x + 1, node.y + 2))
#         # node.m4 = build_tree(Node.new(node.x - 1, node.y + 2))

#         # # # left two, one up or down  stack level too deep 
#         # node.m5 = build_tree(Node.new(node.x - 2, node.y + 1))
#         # node.m6 = build_tree(Node.new(node.x - 2, node.y - 1))

#         # # # down two, one left or right 

#         # node.m7 = build_tree(Node.new(node.x + 1, node.y - 2))
#         # node.m8 = build_tree(Node.new(node.x - 1, node.y - 2)) 
        
#         p "#{node.x},#{node.y}"

#     end 

# end 


# class GraphNode attr_accessor :x, :y, :value, :neighbours

#     def initialize(x, y) 

#         @x = x
#         @y = y
#         @value = [@x, @y]
#         @neighbours = []
#     end 

#     def add_edge(neighbour)
#         @neighbours << neighbour
#     end 

#     def add_node_neighbours

#     end 

# end 

# class Graph attr_accessor :nodes

#     def initialize 
#         @nodes = []
#     end 

#     def add_node(x,y)
#         @nodes << GraphNode.new(x,y)
#     end 

#     def turn_board_to_nodes

#         a = [0,1,2,3,4,5,6,7]
#         a.each do |x|
#             a.each do |y|
#                 self.add_node(x,y)
#             end
#         end
        

#     end 

# end 

# board = Board.new()
# board.colour_board()
# # board.show_board()
# knight = Knight.new()
# board.move_knight(2,3)
# graph = Graph.new()
# # graph.add_node(0,0)
# # graph.add_node(0,1)
# # graph.add_node(1,0)
# # graph.nodes[0].add_edge(graph.nodes[1])
# # graph.nodes[0].add_edge(graph.nodes[2])
# # p graph.nodes[0]
# graph.turn_board_to_nodes()
# graph.nodes[0].add_edge(graph.nodes[1])
# p graph.nodes[0].neighbours
# graph.nodes[1]
# graph.nodes[8]
# p graph.nodes[50]
# p graph.nodes[51]
# knight.possible_moves(2,3)

# graph.nodes.each_with_index do |node, index|
#     node[index].add_edge(graph.nodes[index+1]) 
#     node[index].add_edge(graph.nodes[index+7)    
   
# end 











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
#solving problem doesnt need to link to displaying board!

