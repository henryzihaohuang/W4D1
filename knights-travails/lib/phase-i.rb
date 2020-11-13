require_relative "00_tree_node.rb"

#parent = are the positions where the knight is at 
#children = are the possible new_move positions



class KnightPathFinder



    def self.root_node(starting_pos)
        PolyTreeNode.new(starting_pos)
    end

    MOVES = [
        [2,  1],
        [2, -1],
        [-2, 1],
        [-2,-1],
        [1,  2],
        [1, -2],
        [-1, 2],
        [-1,-2]
    ]


    def self.valid_moves(pos)
        all_valid_moves = []

        y, x = pos

        MOVES.each do |move|
            new_pos = [y + move[0], x + move[1]] 
            if new_pos.all? { |coordinate| coordinate.between?(0,7) }
                all_valid_moves << new_pos
            end     
        end
        
        all_valid_moves
    end

    def initialize(starting_pos)
        @starting_pos = starting_pos
        @considered_positions = [starting_pos]
        build_move_tree
    end

   

    
#  y

# 7| -4 -2 -3  * -6  * -2 -4      [2,1] [3,3] [4.5] [3,7] [1,8]
# 6| -1 -1 -* -1 -1 -1 -1  *      [7,1] [8,3] [7,5] [8,7] [6,8]
# 5|  0  0  0  *  *  0  0  0
# 4|  *  0  0  *  *  0  *  0            
# 3|  0  0  *  0  0  0  0  0
# 2|  *  0  *  0  *  *  0  *
# 1|  1  1  1  *  *  1  1  * 
# 0|  4  *  3  5  6  3  *  4
#   ------------------------- x
#     0  1  2  3  4  5  6  7

# 8| -4 -2 -3 -5 -6 -3 -2 -4      [2,1]
# 7| -1 -1 -1 -1 -1 -1 -1 -1      [7,1]
# 6|  0  0  0  0  0  0  0  0
# 5|  0  0  0  0  0  0  0  0
# 4|  0  0  *  0  0  0  0  0
# 3|  0  0  0  0  0  0  0  0
# 2|  1  1  1  1  1  1  1  1 
# 1|  4  *  3  5  6  3  *  4
#   -------------------------
#     1  2  3  4  5  6  7  8


# [2,1]
# [2,-1]
# [-2,1]
# [-2,-1]
# [1,2]
# [1,-2]
# [-1,2]
# [-1,-2]

# [0] == up or down             - = down + = up
# [1] == left or right          - = left + = right



end