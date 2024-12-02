class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :about_me, :headline, :location, :contact, :github_url, :linked_url, :profile_picture, :title, :work_email, :resume

  def profile_picture
    object.profile_picture.presence && UrlHelpers.rails_blob_url(object.profile_picture)
  end

  def resume
    object.resume.presence && UrlHelpers.rails_blob_url(object.resume)
  end
end
