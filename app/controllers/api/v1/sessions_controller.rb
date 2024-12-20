class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :authenticate_user!
  before_action :set_cache_headers

  def signup
    @user = User.new(signup_params)

    if @user.save
      render json: user_success_response
    else
      render json: { message: @user.errors.to_a}, status: :forbidden
    end
  end

  def create
    if auth_token
      @user = User.find(JsonWebToken.decode(auth_token)[:user_id])

      render json: user_success_response
    else
      render json: {message: "Invalid Credentials"}, status: :forbidden
    end
  end

  private

  def auth_token
    AuthenticateUser.new(authentication_params).call
  end

  def signup_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def authentication_params
    params.permit(:email, :password, :remember_me)
  end

  def user_success_response
    { auth_token: auth_token, first_name: @user.first_name, last_name: @user.last_name, email: @user.email, user_id: @user.id }
  end

  def set_cache_headers
    response.headers["Cache-Control"] = "no-store, no-cache, must-revalidate, max-age=0"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
    response.headers['Last-Modified'] = Time.now.httpdate
  end
end
