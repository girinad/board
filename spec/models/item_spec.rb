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
      @item.tags_are_valid?(['Furniture', 'Chair']).should == true
      @item.tags_are_valid?(@tags).should == true
    end
  end
  
end