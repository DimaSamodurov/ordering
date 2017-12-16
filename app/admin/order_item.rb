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
      order_item.user.name
    end

    column :order_id

    column :product do |order_item|
      order_item.product.name
    end
    column :unit_price
    column :quantity
    column :total_price

    column :created_at
    column :updated_at

    actions
  end


end
