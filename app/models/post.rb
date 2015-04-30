class Post < ActiveRecord::Base


	:title
	:body
	:category_id
	:admin_user_id
	
	belongs_to :category
	belongs_to :admin_user
end
