class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :about_me, :headline, :location, :contact, :github_url, :linked_url, :profile_picture

  def profile_picture
    object.profile_picture.presence && UrlHelpers.rails_blob_url(object.profile_picture)
  end
end
