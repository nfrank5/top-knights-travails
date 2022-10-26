class Knight
    include Comparable
    attr_accessor :knight_edges, :knights
    attr_reader :current_position
    def initialize(current_position)
        @current_position = current_position
        @knights = []
    end
end