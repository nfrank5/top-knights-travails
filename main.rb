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
    puts "You made it in #{moves} moves! Here's your path:"
    path.each do |square|
        puts "#{square}"
    end

end

knight_moves([4,3],[6,1])


