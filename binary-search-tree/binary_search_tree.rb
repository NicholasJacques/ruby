require 'forwardable'

class Bst
    extend Forwardable
    def_delegators :@root, :data, :left, :right

    def initialize(value)
        @root = Node.new(value)
    end

    def insert(value)
        @root = insert_node(@root, value)
    end

    def insert_node(node, value)
        return Node.new(value) if node.nil?
        if value <= node.data
            node.left = insert_node(node.left, value)
        else
            node.right = insert_node(node.right, value)
        end

        node
    end

    def each(&block)
        current = @root
        stack = []

        if block_given?
            while true do
                if !current.nil?
                    stack.push(current)
                    current = current.left
                else
                    if stack.empty?
                        break
                    else
                        current = stack.pop
                        yield current.data
                        current = current.right
                    end
                end
            end
        else
            to_enum(:each)
        end
    end
end

class Node
    attr_accessor :left, :right, :value
    alias_method :data, :value

    def initialize(value)
        @value = value
        @left = nil
        @right = nil
    end
end