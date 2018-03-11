module Builder
  class Labels
    def initialize(board)
      @board = board
    end

    def save
      Label.import(labels)
    end

    private

    def labels
      ::Options::Colors.all.map do |color|
        ::Label.new(
          board: @board,
          color: color[:color],
          code: color[:code]
        )
      end
    end
  end
end
