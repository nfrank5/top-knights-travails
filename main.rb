require_relative 'lib/knight'
require_relative 'lib/board'

def knight_moves(origin, target)
    caballo = Knight.new(origin)
    tablero = Board.new(caballo)
    path = [target]
    moves = tablero.depth(target)
    parent = nil
    until target == origin do
        parent = tablero.find_parent(target)
        target = parent.current_position
        path.unshift(target)
    end
    puts "You made it in #{moves} #{ moves == 1 ? 'move' : 'moves'}! Here's your path:"
    path.each do |square|
        puts "#{square}"
    end 

end

knight_moves([0,0],[1,0])

knight_moves([0,0],[3,3])

knight_moves([3,3],[0,0])

knight_moves([3,3],[4,3])
