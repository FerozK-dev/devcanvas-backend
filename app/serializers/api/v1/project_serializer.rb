class Api::V1::ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :display_image

  def display_image
    object.display_image.presence && UrlHelpers.rails_blob_url(object.display_image)
  end
end
