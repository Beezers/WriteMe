class Post < ActiveRecord::Base


	:title
	:body
	:category_id
	:admin_user_id
	
	belongs_to :category
	belongs_to :admin_user
	#comments are connected to post, if post is deleted all comments are
	has_many :comments, :dependent => :destroy
end
