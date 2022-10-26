require_relative './comparable'




class Knight
    include Comparable
    attr_accessor :knight_edges
    attr_reader :current_position

    def initialize(current_position)
        @current_position = current_position
        @knight_edges = []
    end
end











class XKnight
    include Comparable
    attr_accessor :potential_positions, :depth
    attr_reader :current_position
    @@counter = 0 
    def initialize(current_position, depth = 0)
        @current_position = current_position
        @potential_positions = []
        @depth = depth
        @@counter += 1
    end

    def self.counter
        @@counter
    end

end
