require 'spec_helper'

describe Item do
  describe "#set_tags" do
    it "adds tags to item" do
      item = Item.create title: "Chair"
      tags = 'Furniture, Chair'
      item.set_tags(tags)
      item.tags.should_not be_empty
    end
  end
  
  describe '#tags_are_valid?' do
    it "checks if tags can be converted to an array of strings by , separator" do
      item = Item.new
      tags = 'Furniture, Chair'
      item.tags_are_valid? tags
    end
  end
end