class Photo < ActiveRecord::Base
  belongs_to :item
  attr_accessible :filename, :primary_photo
end
