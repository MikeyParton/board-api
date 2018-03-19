class Card::TimersController < ::Card::BaseController
  def create
    timer = @card.timers.new(user: current_user)

    if timer.start!
      render json: { timers: [TimerSerializer.new(timer)] }
    else
      render json: { error: checklist.errors }, status: 422
    end
  end
end
