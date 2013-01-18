class Photo < ActiveRecord::Base
  belongs_to :item
  attr_accessible :photo, :filename, :primary_photo
  mount_uploader :photo, PhotoUploader
end
