5.times do
  board = FactoryBot.create(:board)

  5.times do
    list = FactoryBot.create(:list, board: board)

    5.times do
      card = FactoryBot.create(:card, list: list)
    end
  end
end
