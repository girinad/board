class Tag < ActiveRecord::Base
  attr_accessible :description, :tag

  has_and_belongs_to_many :items, uniq: true
  
  validates :tag, :uniqueness => { :case_sensitive => false }

  #checks if tags is an array or a string that can be converted to an array using ,
  def self.tags_are_valid?(tags)
    unless tags.is_a?(Array)
      tags = split_tags(tags)
      tags.kind_of?(Array)
    else
      true
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
