class Api::V1::EducationsController < Api::V1::BaseController
  before_action :set_education, only: [:update, :destroy]
  
  def index
    @educations = current_user.educations

    render json: @educations
  end

  def create
    @education = current_user.educations.new(education_params)

    if @education.save
      render json: { message: 'education added successfully' }
    else
      render json: { message: @education.errors.to_a }, status: :forbidden
    end
  end

  def update
    if @education.update(education_params)
      render json: { message: 'education updated successfully' }
    else
       render json: { message: @education.errors.to_a }, status: :forbidden
    end
  end

  def destroy
    if @education.destroy!
      render json: {message: 'education deleted for now'}
    else
       render json: { message: @education.errors.to_a }, status: :forbidden
    end
  end

  private

  def education_params
    params.permit(:school, :degree, :field, :start_year, :end_year, :grade, :activities, :description) 
  end

  def set_education
    @education = current_user.educations.find(params[:id])
  end
end