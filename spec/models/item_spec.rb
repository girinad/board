require 'spec_helper'

describe Item do
  
  before(:each) do
    @tags = 'Furniture, Chair'
    @item = Item.create title: "Chair"
  end
    
  describe "#set_tags" do
    it "adds tags to item" do
      @item.set_tags(@tags)
      @item.tags.collect(&:tag).sort.should == ['Chair','Furniture']
    end
    
    it "checks items for uniquess" do
      @item.set_tags(@tags)
      @item.set_tags("Apple , " + @tags + ",bubble")
      @item.tags.collect(&:tag).sort.should == ['Apple', 'Chair','Furniture', 'bubble']
    end
    
  end
  
  describe '#tags_are_valid?' do
    it "checks if tags can be converted to an array of strings by , separator" do
      Tag.tags_are_valid?(['Furniture', 'Chair']).should == true
      Tag.tags_are_valid?(@tags).should == true
    end
  end
  
  describe 'validation of an item model' do
    
    it "validates that title presents" do
      item = Item.new(title: "Title presents")
      item.valid?.should be_true
    end
    
    it "validates that title length is between 3..255" do
      item_short = Item.new(title: "12")
      item_short.valid?.should be_false
      item_correct_length = Item.new(title: "123")
      item_correct_length.valid?.should be_true
      item_long = Item.new(title: (0..300).to_a.join)
      item_long.valid?.should be_false
    end
    
  end
  
end