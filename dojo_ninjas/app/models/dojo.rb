class Dojo < ActiveRecord::Base
  has_many :ninjas, :dependent => :destroy
  attr_accessible :city, :name, :state

  validates :name, :city, :state, :presence => true
  validates :state, :length => { :minimum => 2, :maximum =>2 }
  validates :state,	:format => { :with => /\A[a-zA-Z]+\z/,
    	:message => "Only letters allowed" }  
end

# Make sure you understand how to get all of the ninjas for any dojo (e.g. get all the ninjas for the first dojo, second dojo, etc)
# Ninja.where(:dojo_id => 4)
# Delete the second dojo.  How could you adjust your model so that it automatically removes all of the ninjas associated with that dojo?
# added :dependent => :destroy to the association above
# ran Dojo.first.destroy
# How would you only retrieve the first_names of the ninja that belongs to the second dojo and order the result by created_at DESC order?
# Ninja.select(:first_name).where(:dojo_id => 5).order('first_name DESC')
