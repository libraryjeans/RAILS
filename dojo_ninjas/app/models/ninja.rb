class Ninja < ActiveRecord::Base
  belongs_to :dojo
  attr_accessible :first_name, :last_name

  validates :first_name, :last_name, :presence => true

end
