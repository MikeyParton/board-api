module Builder
  class Board
    attr_accessor :board

    def initialize(params)
      @params = params
    end

    def save
      begin
        ActiveRecord::Base.transaction do
          @board = ::Board.create(@params)
          ::Builder::Labels.new(@board).save
        end
      rescue => e
        false
      end
    end
  end
end
