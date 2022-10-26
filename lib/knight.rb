class Knight
    attr_accessor :knights
    attr_reader :current_position
    def initialize(current_position)
        @current_position = current_position
        @knights = []
    end
end