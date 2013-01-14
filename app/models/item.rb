class Item < ActiveRecord::Base
  attr_accessible :description, :title, :user_id
  
  belongs_to :user, dependent: :destroy
  has_many :messages
  has_many :photos
  has_and_belongs_to_many :tags, uniq: true
  
  #adds tags to an item
  def set_tags(tags)
    if Tag.tags_are_valid? tags
      Tag.split_tags(tags).each do |tag|
        self.tags << Tag.where(tag: tag).first_or_create
      end
    end
  end

end
