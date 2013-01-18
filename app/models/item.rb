class Item < ActiveRecord::Base
  
  attr_accessible :description, :title, :contact_phone, :contact_name, :state, :sold_at, :photos_attributes

  belongs_to :user
  has_many :messages
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true
  has_and_belongs_to_many :tags, uniq: true
  
  validates :title, :presence => true
  validates :title, :length => {:in => 3..255}
  validates_associated :tags
  validates :contact_phone, :presence => true
  validates :contact_name, :presence => true

  state_machine :initial => :hidden do
    after_transition any - :sold => :sold, :do => :set_sale_date_time

    event :publish do
      transition :hidden => :published
    end

    event :sell do
      transition :hidden => :sold
      transition :published => :sold
    end

    event :hide do
      transition :published => :hidden
    end

    state :hidden, :sold do
      def visible?
        false
      end
    end

    state :published do
      def visible?
        true
      end
    end
  end

  #adds tags to an item
  def set_tags(tags)
    if Tag.tags_are_valid? tags
      self.tags = []
      Tag.split_tags(tags).each do |tag|
        self.tags << Tag.where(tag: tag).first_or_create
      end
    end
  end

  #sets item sale date
  def set_sale_date_time
    @sold_at = Time.new
  end

end
