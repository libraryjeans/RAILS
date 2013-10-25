# Laura's Rails Models Basic assignment
class User < ActiveRecord::Base
  attr_accessible :age, :email_address, :first_name, :last_name

  validates :age, :email_address, :first_name, :last_name, :presence => true
  # validates :age, numericality: { only_integer: => true }
  validates_numericality_of :age, :less_than => 150 
  validates_numericality_of :age, :greater_than_or_equal_to => 10 
  validates :first_name, :last_name, length: { minimum: 2 }
end

# Know how to retrieve all users
# User.all
# Know how to get the first user
# User.first
# Know how to get the last user
# User.last
# Know how to get the users sorted by their first name (order by first_name DESC)
# User.order('first_name DESC')
# Get the record of user whose id is 3 and UPDATE the person's last_name to something else.  Know how to do this directly in the console using .find and .save
# User.update(3, :last_name => "NewName")
# Know how to delete a record of a user whose id is 4 (use something like User.find(2).destroy...).
# User.find(4).destroy