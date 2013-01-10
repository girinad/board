class Item < ActiveRecord::Base
  attr_accessible :description, :title
  
  belongs_to :user
  has_many: :messages
  has_many: :photos
  has_and_belongs_to_many :tags
end
