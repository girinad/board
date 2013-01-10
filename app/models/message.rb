class Message < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  attr_accessible :body, :subject
end
