class TimersController < AuthorizedController
  before_action :find_timer

  def start
    if @timer.start!
      render json: { timers: [TimerSerializer.new(@timer)] }, status: 200
    else
      render json: { errors: @timer.errors.full_messages }, status: 422
    end
  end

  def stop
    if @timer.stop!
      render json: { timers: [TimerSerializer.new(@timer)] }, status: 200
    else
      render json: { errors: @timer.errors.full_messages }, status: 422
    end
  end

  private

  def find_timer
    @timer = Timer.find(params[:id])
  end
end
