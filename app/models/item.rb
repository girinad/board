class Item < ActiveRecord::Base
  attr_accessible :description, :title
  
  belongs_to :user, dependent: :destroy
  has_many :messages
  has_many :photos
  has_and_belongs_to_many :tags, uniq: true
  
  #adds tags to an item
  def set_tags(tags)
    if tags_are_valid? tags
      Item.split_tags(tags).each do |tag|
        self.tags.create tag: tag unless self.tags.collect(&:tag).include? tag
      end
    end
  end
  
  #checks if tags is an array or a string that can be converted to an array using ,
  def tags_are_valid?(tags)
    unless tags.is_a?(Array)
      tags = Item.split_tags(tags)
      tags.kind_of?(Array)
    end
  end
  
  #splits and remove spaces form line of tags
  def self.split_tags(tags)
    _tags = []
    tags.split(',').each do |tag|
      _tags << tag.strip!
    end
  end

end
