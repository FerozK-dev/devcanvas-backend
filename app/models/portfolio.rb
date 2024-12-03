class Portfolio < ApplicationRecord
  belongs_to :user

  has_many :educations
  has_many :experiences
  has_many :projects
end
