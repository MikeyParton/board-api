class OptionsController < AuthorizedController
  def colors
    colors = ::Options::Colors.all
    render json: { colors: colors }, status: 200
  end
end
