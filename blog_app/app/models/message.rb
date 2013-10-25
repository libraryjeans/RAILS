class Message < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  attr_accessible :author, :message

  validates :author, :message, :presence => true
  validates :message, :length => { :minimum => 15 }
end

# added rails g migration add_user_to_message user_id:integer:index
# manually added belongs_to statements