ActiveAdmin.register Comment, :as => "Submissions" do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :user_id, :body, :post_id, :rating
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

	index  do
    column 'User ID', :user 
	column :body
	column :rating
    column :created_at
    actions
	end
	
	form do |f|
	  f.inputs "Comment Details" do
	  f.input :user
      f.input :body
	  f.input :rating
    end
    f.actions
  end

end
