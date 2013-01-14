class Tag < ActiveRecord::Base
  attr_accessible :description, :tag

  has_and_belongs_to_many :items, uniq: true
  
  validates :tag, :uniqueness => true
end
