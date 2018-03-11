class LabelsController < AuthorizedController
  before_action :find_label

  def update
    if @label.update(permitted_params.label)
      render json: { labels: [LabelSerializer.new(@label)] }, status: 200
    else
      render errors: { labels: @label.errors.full_messages }, status: 422
    end
  end

  def find_label
    @label = Label.find(params[:id])
  end
end
