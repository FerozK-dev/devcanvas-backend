class Api::V1::PortfoliosController < Api::V1::BaseController
  skip_before_action :authenticate_user!
  # Public portfolio access
  def show_public
    user = User.find_by(id: params[:id])
    
    if user && user&.publish_portfolio
      render json: user, serializer: Api::V1::UserSerializer #.as_json(include: [:experiences, :educations, :projects])
    else
      render json: { error: "Portfolio not found or not published" }, status: :not_found
    end
  end
end
