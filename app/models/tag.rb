class Tag < ActiveRecord::Base
  attr_accessible :description, :tag

  has_and_belongs_to_many :items
end
