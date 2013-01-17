require 'spec_helper'

describe Item do
  
  before(:each) do
    @tags = 'Furniture, Chair'
    @item = Item.create title: "Chair", contact_phone: "111-111-1111", contact_name: "Seller"
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
    
    it "checks update of tags" do
      @item.set_tags(@tags)
      @item.set_tags("Apple,bubble")
      @item.tags.collect(&:tag).sort.should == ['Apple', 'bubble']
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
      item = Item.new(contact_phone: "111", contact_name: "name")
      item.valid?.should be_false
    end
    
    it "validates that title length is between 3..255" do
      @item.title = "12"
      item_short = @item
      item_short.valid?.should be_false
      @item.title = "123"
      item_correct_length = @item
      item_correct_length.valid?.should be_true
      @item.title = (0..300).to_a.join
      item_long = @item
      item_long.valid?.should be_false
    end
    
    it "validates that contact phone presents" do
      item = Item.new(title: "Title presents", contact_name: "name")
      item.valid?.should be_false
    end
    
    it "validates that contact name presents" do
      item = Item.new(title: "Title presents", contact_phone: "111")
      item.valid?.should be_false
    end
    
  end
  
  describe 'item state_machine' do
    it "publishes an item" do
      @item.publish
      @item.visible?.should be_true
      @item.state.should eq 'published'
    end

    it "hides an item" do
      @item.hide
      @item.visible?.should be_false
      @item.state.should eq 'hidden'
    end

    it "sells a published item" do
      @item.publish
      @item.visible?.should be_true
      @item.sell
      @item.visible?.should be_false
      @item.state.should eq 'sold'
      @item.sold_at == Time.new
    end

    it "sells a hidden item" do
      @item.sell
      @item.visible?.should be_false
      @item.state.should eq 'sold'
      @item.sold_at == Time.new
    end

    it "tries to publish a sold item" do
      @item.sell
      @item.publish
      @item.visible?.should be_false
      @item.state.should eq 'sold'
      @item.sold_at == Time.new
    end

    it "tries to publish a sold item" do
      @item.sell
      @item.publish
      @item.visible?.should be_false
      @item.state.should eq 'sold'
      @item.sold_at == Time.new
    end

  end

  
end