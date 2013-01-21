class Photo < ActiveRecord::Base
  belongs_to :item
  attr_accessible :photo, :primary_photo
  mount_uploader :photo, PhotosUploader
end
