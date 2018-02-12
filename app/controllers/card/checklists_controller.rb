class ChecklistsController < ApplicationController
  def create
  end

  private

  def find_card
    @card = Card.find(params[:card_id])
  end
end
