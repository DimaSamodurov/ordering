ActiveAdmin.register OrderItem do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :code, :order_num, :note, :customer_code, :customer_name, :contractor_code, :contractor_name, :user_id, :order_id
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

  column :note
  column :code
  column :order_num
  column :customer_code
  column :customer_name
  column :contractor_code
  column :contractor_name
  actions
end


end
