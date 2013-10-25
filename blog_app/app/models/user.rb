class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name

  has_many :messages, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :owners, :dependent => :destroy
  has_many :blogs, :through => :owners

  validates :first_name, :last_name, :email, :presence => true
  validates :email, :uniqueness => true
  validates :email, :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
end

# To add the first user to the last blog, you would do the following: User.first.blogs = [Blog.last]. To add both the first and the last blog to the first user, you would do User.first.blogs = [Blog.first, Blog.last]. What would you do to add the second and third user to the second blog?
# User.find(2).blogs = [Blog.find(2), Blog.find(3)]
# Have the first user create 3 posts, assign the first 2 posts to the first blog and the last post to the last blog
# p1 = User.first.posts.new(:title=>"Title1", :content=>"Content1")
# p1.blog = Blog.first
# p1.save 
# You can create a new blog for the user by calling: "User.first.blogs.create(:name => "New Blog", :description => "New Description")". How would you create a new post that belongs to the second blog? How would you indicate that this new post was created by the first user?
# post = Blog.find(2).posts.create(:title=>"this is another title", :content=>"active record can kiss my ass")
# post.user = User.first
# You can retrieve the user that owns the post id 1 by calling "Post.find(1).user". This would return an object that has the user information. You can change who wrote Post.find(1) by calling for example "Post.find(1).user = User.last". How would you retrieve information of the user who wrote the last message? How would you change the owner of the last message to the first user?
# Message.last.user
# Message.last.user = User.first - why doesn't this work?
# Be able to create messages written by the second user in any post
# message = Post.last.messages.create(:author=>"Jim Beam", :message=>"Time for whiskey")
# message.user = User.find(2)
# Be able to retrieve all messages from any specific post
# Post.last.messages.all
# Be able to retrieve all the users that "own" any specific blog
# Blog.find(2).users.all