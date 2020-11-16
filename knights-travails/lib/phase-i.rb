require_relative "00_tree_node.rb"

#parent = are the positions where the knight is at 
#children = are the possible new_move positions




class KnightPathFinder

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


    def self.valid_moves(pos)     # 0,0
        all_valid_moves = []

        y, x = pos.value #0,0

        MOVES.each do |move|
            new_pos = [y + move[0], x + move[1]] 
                      # 0 +  2, 0 + 1 == pos = [2,1]
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

    attr_accessor :root_node, :considered_positions

    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos)

        new_moves.reject! {|position| @considered_positions.include?(position)}

        new_moves.each {|new_pos| @considered_positions << new_pos}

        new_moves
    end

    def build_move_tree
        self.root_node = PolyTreeNode.new(@starting_pos)

        nodes = [root_node]
        while !nodes.empty?
            current_pos = nodes.shift
            
            new_move_positions(current_pos).each do |next_pos|
                
                new_node = PolyTreeNode.new(next_pos)

                current_pos.add_child(new_node)

                nodes << new_node
            end

        end

    end


    def find_path(end_pos)
        values = []
        
        end_node = root_node.bfs(end_pos)

        back_path = trace_path_back(end_node).reverse

        back_path.each do |path_pos|
            values << path_pos.value
        end

        values
    end

    def trace_path_back(end_pos)
        node = []
        current_node = end_pos
        while !current_node.nil?
            node << current_node
            current_node = current_node.parent
        end
        node
    end

    # def bfs(target)
        
    #     nodes = [self]


    #     while !nodes.empty?
    #         return nodes.first if nodes.first.value == target
    #         nodes += nodes.shift.children
    #     end
        
    #     nil
    # end

    
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

# pos1 = KnightPathFinder.new([0,0])
# # p pos1
# p KnightPathFinder.valid_moves(pos1)

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]