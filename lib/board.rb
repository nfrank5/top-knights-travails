
class Board
    KNIGHT_MOVES = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
    attr_reader :board

    def initialize(knight)
        @board = build_board(knight)
    end

    def build_board(knight, all_posible_edges = [], queue = [])
        p all_posible_edges.uniq.length
        return if knight.nil?
     
        knight_position = knight.current_position
        KNIGHT_MOVES.each do |move| 

            new_position = [(knight_position[0] + move[0]), (knight_position[1] + move[1])]

            if(valid_position?(new_position))
                new_knight = Knight.new(new_position) 
                queue.unshift(new_knight) unless all_posible_edges.flatten(1).include?(new_position)

                knight.knight_edges.unshift([knight_position, new_position]) unless (all_posible_edges.include?([knight_position, new_position]) || all_posible_edges.include?([new_position, knight_position]))

                all_posible_edges.unshift([knight_position, new_position]) unless (all_posible_edges.include?([knight_position, new_position]) || all_posible_edges.include?([new_position, knight_position]))
                
                
            end
        end
        p knight        
        build_board(queue.pop, all_posible_edges, queue)
        knight
    end

    def valid_position?(position)
        position[0].between?(0, 7) && position[1].between?(0,7)
    end


    def navigate(target, current_knight = @board)

        current_knight.knight_edges.each do |edge|
            p "#{edge} - #{[current_knight.current_position]}"
            p "#{edge - [current_knight.current_position]}"

        end 
    end

end



class XBoard
    KNIGHT_MOVES = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
    attr_reader :board

    def initialize(knight)
        @board = build_board(knight)
    end

    def build_board(knight, all_posible_positions = [], queue = [], depth = 1)
        return if knight.depth >= 1250
        
        curr_pos = knight.current_position
        KNIGHT_MOVES.each do |move| 

            new_position = Knight.new([(curr_pos[0] + move[0]), (curr_pos[1] + move[1])], depth)
            if(valid_position?(new_position.current_position))
                all_posible_positions.unshift(new_position.current_position) unless all_posible_positions.include?(new_position.current_position)

                #p all_posible_positions.uniq.length
                #p all_posible_positions.length
                p new_position.depth
                queue.unshift(new_position)
                knight.potential_positions.unshift(new_position)
            end
        end
        depth += 1
        build_board(queue.pop, all_posible_positions, queue, depth)
        knight
    end


    def pretty_print(k = self, positions = [], lista = [])
        return nil if k.nil?
        
        lista.push(k.current_position)

        p lista.cur if k.current_position == [7,7]
        #p lista.uniq.length



        k.potential_positions.each do | curr_k | 
            positions.unshift(curr_k)
        end

        printt(positions.pop, positions,lista)

    end



    def shortest_move(target, origin = @board, moves = [], shortest = [], index = 0)
        return shortest if origin.potential_positions.empty?
        index += 1
        target == origin if target == origin
        moves = moves[0..index]

        #p "#{target.current_position} == #{origin.current_position}"
        p origin.current_position if target == origin
        #p shortest
        #gets

        if target == origin && (moves.length < shortest.length || shortest.empty?)
            moves.push(origin.current_position)
            shortest = moves[0 .. -1] 
            moves = moves[0..index]
            p 1
            return shortest
        end
        moves.push(origin.current_position)
        index =+ 1

        origin.potential_positions.each do |next_move|
            shortest = self.shortest_move(target, next_move, moves, shortest)
        end

        index -= 1
        shortest 

    end
end