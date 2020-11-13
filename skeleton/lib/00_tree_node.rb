class PolyTreeNode

    attr_reader :children, :parent, :value
    
    def initialize(value, parent = nil, children=[])
        @value = value
        @children = children
        @parent = parent
    end
    require 'byebug'
#self = instance of node. (4,[6,7,8,9,0]) 


    def parent=(node) #node == new parents
        unless self.parent == nil   # root node
            self.parent.children.delete(self)
        end
          # self = (Parents, [Mark]) = >        (Parents, [])

        @parent = node   # 
        # debugger
        node.children << self unless node.nil? 

        # (Bob & Mary, [Karen, Tom])
        # (Bob & Mary, [Karen, Tom, Mark])
    end


#(4,[6,7,8,9,0])
    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if !children.include?(child)
            raise "that child's parent does not exist"
        end

        child.parent = nil
    end

#(4,[6,7,8,9,0],'peggy')
    #part two

    def dfs(target)
        #return self if it contains the value 
        return self if self.value == target
    
        #should search for descendent

        self.children.each do |child|
            next_level = child.dfs(target) 
            return next_level unless next_level == nil
        end

        nil


    end


    def bfs(target)
        
        nodes = [self]


        while !nodes.empty?
            return nodes.first if nodes.first.value == target
            nodes += nodes.shift.children
        end
        
        nil
    end

end


#       a     parent [children]:      a  [b,c]
#     /   \                           b, [d,e]   
#    b      c                         c  [f,g]
#  /  \    /  \   
# d    e  f     g      




# arr = [a]

# return a if a.value == target 
# arr += a.childern