class Node
	attr_accessor :moves, :position, :lastmove
	def initialize
		@position = nil
		@moves = []
		@lastmove = nil
	end
end


def knight_moves(start, stop)
	check = nil
	output = []
	current = Node.new
	current.position = start
	queue = [current]
	until queue.empty?
		check = queue[0]
		break if check.position == stop
		moves = check_moves(check.position)
		moves.each do |move|
			thing = Node.new
			thing.position = move
			thing.lastmove = check
			queue.push(thing)
		end
		queue.shift
	end
	until check.lastmove == nil
		output.push(check.position)
		check = check.lastmove
	end
	output.push(start)
	output = output.reverse
	puts "You made it in #{output.size-1} moves! Here they are:"
	output.each do |i|
		puts "[#{i[0]}, #{i[1]}]"
	end
end


def check_moves(position)
	final = []
	move1 = [(position[0]+2), position[1]+1]
	move2 = [(position[0]+2), position[1]-1]
	move3 = [(position[0]-2), position[1]+1]
	move4 = [(position[0]-2), position[1]-1]
	move5 = [(position[0]+1), position[1]+2]
	move6 = [(position[0]+1), position[1]-2]
	move7 = [(position[0]-1), position[1]+2]
	move8 = [(position[0]-1), position[1]-2]
	moves = [move1, move2, move3, move4, move5, move6, move7, move8]
	moves.each do |move|
		final.push(move) if (9 > move[0] && move[0] > -1) && (9 > move[1] && move[1] > -1)
	end
	final
end