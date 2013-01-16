class Item < ActiveRecord::Base
  
  STATUS_HIDDEN = 0
  STATUS_PUBLISHED = 1
  STATUS_SOLD = 2
  
  attr_accessible :description, :title, :contact_phone, :contact_name, :status, :sold_at
  
  belongs_to :user
  has_many :messages
  has_many :photos
  has_and_belongs_to_many :tags, uniq: true
  
  validates :title, :presence => true
  validates :title, :length => {:in => 3..255}
  validates_associated :tags
  validates :contact_phone, :presence => true
  validates :contact_name, :presence => true
  
  #adds tags to an item
  def set_tags(tags)
    if Tag.tags_are_valid? tags
      self.tags = []
      Tag.split_tags(tags).each do |tag|
        self.tags << Tag.where(tag: tag).first_or_create
      end
    end
  end

end
