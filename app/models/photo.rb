class Photo < ActiveRecord::Base
  belongs_to :item
  attr_accessible :photo
  mount_uploader :photo, PhotosUploader

end
