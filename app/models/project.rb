class Project < ApplicationRecord
  belongs_to :user
  
  has_one_attached :display_image
end
