class Api::V1::EducationSerializer < ActiveModel::Serializer
  attributes :id, :school, :degree, :field, :start_year, :end_year, :grade, :activities, :description
end
