newclass Post < ActiveRecord::Base
  has_many :messages, :dependent => :destroy
  belongs_to :blog
  belongs_to :user

  attr_accessible :content, :title

  validates :title, :content, :presence => true
  validates :title, :length => { :minimum => 7 }
end

# know how to retrieve all posts for the first blog
# Blog.first.post.all
# know how to retrieve all posts for the last blog (sorted by title in the DESC order)
# Blog.last.posts.order('title ASC')
# know how to update the first post's title
# Post.update(1, :title => "Brand spanking")
# know how to delete the third post (have the model automatically delete all messages associated with the third post when you delete the third post)
# Post.find(3).destroy
# know how to retrieve all blogs
# Blog.all
# know how to retrieve all blogs whose id is less than 5
# Blog.where("id < 5")

# added rails g migration add_user_to_post user_id:integer:index
# manually added belongs_to statements
