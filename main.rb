require_relative 'lib/knight'
require_relative 'lib/board'



caballo = Knight.new([0,0])
tablero = Board.new(caballo)
p tablero.board
p tablero.navigate(1)
#caballo.pretty_print()
#caballo.potential_positions[0]




def knight_moves(origin, target)
    origin_knight = Knight.new(origin)
    target_knight = Knight.new(target)
    board = Board.new(origin_knight)
    board.shortest_move(target_knight)
end


# p knight_moves([0,0], [6,6])
