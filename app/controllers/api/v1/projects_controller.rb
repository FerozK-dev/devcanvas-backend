class Api::V1::ProjectsController < Api::V1::BaseController
  before_action :set_project, only: [:update, :destroy]

  def index
    @projects = current_user.projects

    render json: @projects#, serializer: Api::V1::ProjectSerializer
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      render json: @project, serializer: Api::V1::ProjectSerializer
    else
      render json: { message: @project.errors.to_a }, status: :forbidden
    end
  end

  def update
    if @project.update(project_params)
      render json: @project, serializer: Api::V1::ProjectSerializer
    else
       render json: { message: @project.errors.to_a }, status: :forbidden
    end
  end

  def destroy
    if @project.destroy!
      render json: {message: 'project deleted for now'}
    else
       render json: { message: @project.errors.to_a }, status: :forbidden
    end
  end

  private

  def project_params
    params.permit(:title, :description, :display_image)
  end

  def set_project
    @project = current_user.projects.find(params[:id])
  end
end
