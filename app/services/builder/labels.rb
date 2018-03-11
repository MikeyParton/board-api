module Builder
  class Labels
    COLORS = [
      '#64BC55', #green
      '#F1D52F', #yellow
      '#FDAA54', #orange
      '#E95B4B', #red
      '#C27ADE', #violet
      '#117ABD'  #blue
    ]

    def initialize(board)
      @board = board
    end

    def save
      Label.import(labels)
    end

    private

    def labels
      COLORS.map do |color|
        ::Label.new(board: @board, color: color)
      end
    end
  end
end
