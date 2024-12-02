class Api::V1::ExperiencesController < Api::V1::BaseController
  before_action :set_experience, only: [:update, :destroy]
  
  def index
    @experiences = current_user.experiences

    render json: @experiences
  end

  def create
    @experience = current_user.experiences.new(experience_params)

    if @experience.save
      render json: { message: 'experience added successfully' }
    else
      render json: { message: @experience.errors.to_a }, status: :forbidden
    end
  end

  def update
    if @experience.update(experience_params)
      render json: { message: 'experience updated successfully' }
    else
       render json: { message: @experience.errors.to_a }, status: :forbidden
    end
  end

  def destroy
    if @experience.destroy!
      render json: {message: 'experience deleted for now'}
    else
       render json: { message: @experience.errors.to_a }, status: :forbidden
    end
  end

  private

  def experience_params
    params.permit(:title, :company, :description, :start_date, :end_date, :description, :location, :employment_type)
  end

  def set_experience
    @experience = current_user.experiences.find(params[:id])
  end
end
