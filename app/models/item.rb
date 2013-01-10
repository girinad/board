class Item < ActiveRecord::Base
  attr_accessible :description, :title
  
  belongs_to :user
  has_many: :messages
end
