class PolyTreeNode

    attr_reader :children, :parent, :value
    
    def initialize(value, parent = nil, children=[])
        @value = value
        @children = children
        @parent = parent
    end


    def parent=(node) 
        unless self.parent == nil 
            self.parent.children.delete(self)
        end

        @parent = node 
       
        node.children << self unless node.nil? 
    end



    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if !children.include?(child)
            raise "that child's parent does not exist"
        end

        child.parent = nil
    end


    # def dfs(target)
    #     return self if self.value == target
    
    #     self.children.each do |child|
    #         next_level = child.dfs(target) 
    #         return next_level unless next_level == nil
    #     end

    #     nil


    # end


    def bfs(target)
        
        nodes = [self]


        while !nodes.empty?
            return nodes.first if nodes.first.value == target
            nodes += nodes.shift.children
        end
        
        nil
    end

end






