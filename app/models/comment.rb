class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  validates_presence_of :body
  validates_length_of :body, :within=> 2..160
  

end
