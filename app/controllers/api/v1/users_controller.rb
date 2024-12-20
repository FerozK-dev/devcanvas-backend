class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user

  def show_profile
    render json: current_user, serializer: Api::V1::UserSerializer
  end

  def update
    if @user.update(user_params)
      render json: @user, serializer: Api::V1::UserSerializer
    else
      render json: { error: @user.errors.to_a }, status: :forbidden
    end
  end

  def toggle_portfolio_status
    if @user.update(publish_portfolio: !@user&.publish_portfolio)
      render json: 'Portfolio status updated successfully'
    else
      render json: { error: @user.errors.to_a }, status: :forbidden
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.permit(:first_name, :last_name, :location, :github_url, :linked_url, :publish_portfolio,
                  :work_emai, :title, :headline, :about_me, :contact, :profile_picture, :work_email, :resume)
  end
end
