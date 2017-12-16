ActiveAdmin.register OrderItem do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :user_id, :order_id, :product_id, :quantity
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
  column :user do |order_item|
  order_item.user.role ||
  order_item.user.email

  end
  column :user_id
  column :order_id
  column :product_id
  column :quantity


  actions
end



end
