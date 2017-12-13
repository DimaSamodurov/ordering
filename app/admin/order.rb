ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :user_id, :product_code, :product_name, :amount, :price, :note
#
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
  column :user do |order|
    order.user.email
  end

  column :product_code
  column :product_name
  column :amount
  column :price
  column :note

  actions
end



end
