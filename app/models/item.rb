class Item < ActiveRecord::Base
  attr_accessible :description, :title
  
  belongs_to :user
  has_many :messages
  has_many :photos
  has_and_belongs_to_many :tags, uniq: true
  
  validates :title, :presence => true
  validates :title, :length => {:in => 3..255}
  validates_associated :tags
  
  #adds tags to an item
  def set_tags(tags)
    if Tag.tags_are_valid? tags
      Tag.split_tags(tags).each do |tag|
        self.tags << Tag.where(tag: tag).first_or_create
      end
    end
  end

end
