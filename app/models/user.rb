class User < ApplicationRecord
  has_attached_file :photo
  has_attached_file :cover_image

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :fullname, presence: true, length: {minimum: 5, maximum: 30}
  validates_attachment_content_type :photo, :cover_image,  
                      :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
