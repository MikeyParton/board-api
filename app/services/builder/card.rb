module Builder
  class Card
    attr_accessor :card

    def initialize(params)
      @params = params
    end

    def save
      begin
        ActiveRecord::Base.transaction do
          @card = ::Card.new(@params)
          board = @card.board

          # Increment counter on board
          cards_count = board.cards_count + 1
          board.update(cards_count: cards_count)

          # Assign new card number
          @card.number = cards_count
          @card.save
        end
      rescue => e
        false
      end
    end
  end
end
