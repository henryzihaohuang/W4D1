class PolyTreeNode

    attr_reader :position, :children_moves
    
    def initialize(position, children_moves=[])
        @position = position
        @children_moves = children_moves
    end

    