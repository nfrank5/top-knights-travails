
class Board
    KNIGHT_MOVES = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
    attr_reader :board

    def initialize(knight)
        @board = build_board(knight)
    end

    def build_board(knight, all_posible_edges = [], queue = [], all_posible_positions = [knight.current_position])
        #p "all posible positions #{all_posible_positions.sort}"
        #p "current position #{knight.current_position}" unless knight.nil?
        #p "Queue: #{queue}"
        #gets
        return if knight.nil?

        knight_position = knight.current_position
        KNIGHT_MOVES.each do |move| 

            new_position = [(knight_position[0] + move[0]), (knight_position[1] + move[1])]

            if(valid_position?(new_position))
                next if all_posible_positions.include?(new_position)
                all_posible_positions.push(new_position) unless all_posible_positions.include?(new_position)
                new_knight = Knight.new(new_position) 
                queue.unshift(new_knight)                

                knight.knights.push(new_knight)
    

            end
        end
        build_board(queue.pop, all_posible_edges, queue, all_posible_positions)

        knight
    end

    def valid_position?(position)
        position[0].between?(0, 7) && position[1].between?(0,7)
    end





    def depth(target, knight = @board, count = 0, d = 0)
        if target == knight.current_position
            d = count
        end
        count += 1
        knight.knights.each do |k|
            d = depth(target, k, count, d)
        end
        count -=1 
        d
    end

    def find_parent(target, knight = @board)
        return if knight.nil?
        queue = [knight]
        loop do
            break if queue.empty?
            current_knight = queue.pop 
            current_knight.knights.each do |k|

                unless k.nil?
                    queue.unshift(k) 
                    if target == k.current_position
                        return current_knight
                    end
                end
            end
        end
        return knight
    end


end