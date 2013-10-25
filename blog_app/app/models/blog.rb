class Blog < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  has_many :owners, :dependent => :destroy
  has_many :users, :through => :owners	

  attr_accessible :description, :name

  validates :name, :description, :presence => true
end
