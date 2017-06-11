class Node
	attr_accessor :value, :parent, :leftleaf, :rightleaf
	def initialize
		@value = nil
		@parent = nil
		@leftleaf = nil
		@rightleaf = nil
	end
end

class BinaryTree
	attr_accessor :root
	def build_tree(array)
		@root = nil
		pointer = nil
		array.each do |num|
			if @root == nil
				@root = Node.new
				@root.value = num
				pointer = @root
			else
				until (pointer.leftleaf == nil && pointer.value > num) || (pointer.rightleaf == nil && pointer.value < num)
					pointer = pointer.leftleaf if pointer.value > num && pointer.leftleaf != nil
					pointer = pointer.rightleaf if pointer.value < num && pointer.rightleaf != nil
				end
				if pointer.value > num
					pointer.leftleaf = Node.new
					pointer.leftleaf.value = num
					pointer = @root
				elsif pointer.value < num
					pointer.rightleaf = Node.new
					pointer.rightleaf.value = num
					pointer = @root
				end
			end
		end
	end

	def breadth_first_search(val)
		queue = []
		queue.push(@root)
		check = nil
		until queue.empty?
			check = queue.first
			break if check.value == val
			queue.push(check.leftleaf) if check.leftleaf != nil
			queue.push(check.rightleaf) if check.rightleaf != nil
			queue.shift
			check = nil
		end
		check
	end

	def depth_first_search(val)
		stack = []
		stack.push(@root)
		check = nil
		until stack.empty?
			check = stack.last
			break if check.value == val
			stack.pop
			stack.push(check.rightleaf) if check.rightleaf != nil
			stack.push(check.leftleaf) if check.leftleaf != nil
			check = nil
		end
		check
	end

	def dfs_rec(val, node=@root)
		return node if node.value == val
		dfs_rec(val, node.leftleaf) if node.leftleaf != nil
		dfs_rec(val, node.rightleaf)  if node.rightleaf != nil
	end
end