class Api::V1::ExperienceSerializer < ActiveModel::Serializer
  attributes :id, :title, :company, :description, :start_date, :end_date, :description, :location, :employment_type
end
